#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <unordered_map>
#include <cmath>
#include <algorithm>
#include <iomanip>
#include <future>
#include <mutex>
#include <string>

using namespace std;

// Estructuras globales 
unordered_map<string, vector<string>> grafo; 
unordered_map<string, double> pagerank;      // PageRank de cada nodo
unordered_map<string, double> pagerank_temp; // PageRank temporal 
mutex mtx;                                   // mutex

// Función para cargar una parte del grafo por lineas
void cargar_grafo_parcial(const vector<string> &lineas)
{
    for (const string &linea : lineas)
    {
        istringstream iss(linea);
        string origen, destino;
        if (getline(iss, origen, ':')) // Separar por :
        {
            if (getline(iss, destino))
            {
                destino.erase(remove_if(destino.begin(), destino.end(), ::isspace), destino.end()); // Eliminar espacios
                lock_guard<mutex> lock(mtx);                                                        // Proteger acceso 
                grafo[origen].push_back(destino);
                grafo[destino]; // Asegurar que el destino también esté en el grafo
            }
        }
    }
}

// Función para cargar el grafo en chunks
void cargar_grafo(const string &nombre_archivo, size_t chunk_size)
{
    ifstream archivo(nombre_archivo);
    string linea;
    vector<string> buffer;
    vector<future<void>> futuros;

    while (getline(archivo, linea))
    {
        buffer.push_back(linea);
        if (buffer.size() == chunk_size) // Procesar el chunk cuando alcanza el tamaño
        {
            vector<string> buffer_copy = buffer;
            futuros.push_back(async(cargar_grafo_parcial, buffer_copy)); // Cargar el chunk de manera asíncrona
            buffer.clear();
        }
    }
    if (!buffer.empty()) // Procesar el último chunk si no está vacío
    {
        cargar_grafo_parcial(buffer);
    }

    for (auto &fut : futuros) // Esperar a que todos los futuros terminen
    {
        fut.get();
    }
}

// Inicializar el PageRank de cada nodo
void inicializar_pagerank()
{
    double rank_inicial = 1.0 / grafo.size(); // Valor inicial
    for (const auto &nodo : grafo)
    {
        pagerank[nodo.first] = rank_inicial;
    }
}

// Función para calcular una parte del PageRank de los nodos
void calcular_pagerank_parcial(const vector<string> &nodos)
{
    for (const auto &nodo : nodos)
    {
        double suma = 0.0;
        for (const auto &entrante : grafo) // Recorrer todos los nodos para encontrar los enlaces entrantes
        {
            for (const auto &destino : entrante.second)
            {
                if (destino == nodo)
                {
                    suma += pagerank[entrante.first] / grafo[entrante.first].size();
                    break; // Una vez encontrado, no seguir buscando
                }
            }
        }
        lock_guard<mutex> lock(mtx); // Proteger acceso concurrente a 'pagerank_temp'
        pagerank_temp[nodo] = (1.0 - 0.85) / grafo.size() + 0.85 * suma;
    }
}

// Función principal
void calcular_pagerank()
{
    vector<string> nodos;
    for (const auto &nodo : grafo)
    {
        nodos.push_back(nodo.first);
    }

    int num_hilos = thread::hardware_concurrency();              // Número de hilos disponibles
    int chunk_size = (nodos.size() + num_hilos - 1) / num_hilos; // distribucion equitativa

    while (true) // Bucle hasta converger
    {
        vector<future<void>> futuros;
        for (int j = 0; j < num_hilos; ++j)
        {
            vector<string> subvec;
            for (int k = j * chunk_size; k < (j + 1) * chunk_size && k < nodos.size(); ++k)
            {
                subvec.push_back(nodos[k]);
            }
            futuros.push_back(async(calcular_pagerank_parcial, subvec)); // Calcular PageRank de manera asíncrona
        }

        for (auto &fut : futuros) // Esperar a que todos los futuros terminen
        {
            fut.get();
        }

        bool convergido = true;
        for (const auto &nodo : grafo)
        {
            if (fabs(pagerank_temp[nodo.first] - pagerank[nodo.first]) > 1e-10) // Verificar convergencia
            {
                convergido = false;
            }
            pagerank[nodo.first] = pagerank_temp[nodo.first];
        }

        if (convergido) // Si ha convergido, salir del bucle
            break;
    }
}

// Función para escribir
void escribir_pagerank(const string &nombre_archivo)
{
    ofstream archivo(nombre_archivo);
    vector<string> nodos;
    for (const auto &nodo : grafo)
    {
        nodos.push_back(nodo.first);
    }
    sort(nodos.begin(), nodos.end());

    for (const auto &nodo : nodos)
    {
        archivo << nodo << " : " << fixed << setprecision(6) << pagerank[nodo] << "\n";
    }
}

int main(int argc, char *argv[])
{
    if (argc < 5)
    {
        cerr << "Uso: " << argv[0] << " -src <archivo_entrada> -dst <archivo_salida> \n";
        return 1;
    }

    string archivo_entrada, archivo_salida;
    size_t chunk_size = 10000;
    for (int i = 1; i < argc; ++i)
    {
        if (string(argv[i]) == "-src")
        {
            archivo_entrada = argv[++i];
        }
        else if (string(argv[i]) == "-dst")
        {
            archivo_salida = argv[++i];
        }
    }

    cargar_grafo(archivo_entrada, chunk_size); // Cargar el grafo desde el archivo
    inicializar_pagerank();                    // Inicializar el PageRank
    calcular_pagerank();                       // Calcular el PageRank
    escribir_pagerank(archivo_salida);         // Escribir el resultado en un archivo

    return 0;
}
