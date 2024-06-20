#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <unordered_map>
#include <cmath>
#include <algorithm>
#include <iomanip>

using namespace std;

unordered_map<string, vector<string>> grafo;
unordered_map<string, double> pagerank;
unordered_map<string, double> pagerank_temp;

void cargar_grafo(const string &nombre_archivo)
{
    ifstream archivo(nombre_archivo);
    string linea;
    while (getline(archivo, linea))
    {
        istringstream iss(linea);
        string origen, destino;
        if (getline(iss, origen, ':'))
        {
            while (getline(iss, destino))
            {
                destino.erase(remove_if(destino.begin(), destino.end(), ::isspace), destino.end());
                grafo[origen].push_back(destino);
                grafo[destino]; 
            }
        }
    }
}

void inicializar_pagerank()
{
    double rank_inicial = 1.0 / grafo.size();
    for (const auto &nodo : grafo)
    {
        pagerank[nodo.first] = rank_inicial;
    }
}

void calcular_pagerank()
{
    for (int i = 0; i < 100; ++i)
    {
        for (const auto &nodo : grafo)
        {
            double suma = 0.0;
            for (const auto &entrante : grafo[nodo.first])
            {
                suma += pagerank[entrante] / grafo[entrante].size();
            }
            pagerank_temp[nodo.first] = (1.0 - 0.85) / grafo.size() + 0.85 * suma;
        }

        bool convergido = true;
        for (const auto &nodo : grafo)
        {
            if (fabs(pagerank_temp[nodo.first] - pagerank[nodo.first]) > 1e-10)
            {
                convergido = false;
            }
            pagerank[nodo.first] = pagerank_temp[nodo.first];
        }

        if (convergido)
            break;
    }
}

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
        archivo << nodo << " : " << pagerank[nodo] << "\n";
    }
}

int main(int argc, char *argv[])
{
    if (argc < 5)
    {
        cerr << "Uso: " << argv[0] << " -src <archivo_entrada> -dst <archivo_salida>\n";
        return 1;
    }

    string archivo_entrada, archivo_salida;
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

    cargar_grafo(archivo_entrada);
    inicializar_pagerank();
    calcular_pagerank();
    escribir_pagerank(archivo_salida);

    return 0;
}
