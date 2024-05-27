#include <iostream>
#include <string>
#include <vector>
#include <thread>
#include <unordered_map>
#include <mutex>
#include <algorithm>
#include <queue>
#include <condition_variable>

using namespace std;

mutex mtx;
condition_variable cv;
queue<string> trabajos;
bool terminados = false;

unordered_map<string, int> conteoGlobal;

// Función para contar palabras en una parte del texto
void contarPalabras()
{
    while (true)
    {
        unique_lock<mutex> lock(mtx);
        cv.wait(lock, []
                { return !trabajos.empty() || terminados; });

        if (trabajos.empty() && terminados)
            break;

        string trozo = trabajos.front();
        trabajos.pop();
        lock.unlock();

        unordered_map<string, int> conteoLocal;
        string palabra;
        for (char c : trozo)
        {
            if (isspace(c))
            {
                if (!palabra.empty())
                {
                    conteoLocal[palabra]++;
                    palabra.clear();
                }
            }
            else
            {
                palabra += c;
            }
        }
        if (!palabra.empty())
        {
            conteoLocal[palabra]++;
        }

        lock.lock();
        for (const auto &p : conteoLocal)
        {
            conteoGlobal[p.first] += p.second;
        }
    }
}

int main()
{
    size_t chunkSize = 10 * 1024 * 1024; // Tamaño del trozo en bytes
    int numHilos = thread::hardware_concurrency();
    vector<thread> hilos;

    // Crear hilos
    for (int i = 0; i < numHilos; ++i)
    {
        hilos.push_back(thread(contarPalabras));
    }

    string buffer;
    string restoPalabra;

    while (!cin.eof())
    {
        buffer.resize(chunkSize);
        cin.read(&buffer[0], chunkSize);
        size_t bytesRead = cin.gcount();
        if (bytesRead == 0)
            break;

        buffer.resize(bytesRead);

        if (!restoPalabra.empty())
        {
            buffer = restoPalabra + buffer;
            restoPalabra.clear();
        }

        size_t ultimoEspacio = buffer.find_last_of(" \n\r\t");
        if (ultimoEspacio != string::npos && ultimoEspacio < buffer.size() - 1)
        {
            restoPalabra = buffer.substr(ultimoEspacio + 1);
            buffer = buffer.substr(0, ultimoEspacio);
        }

        {
            lock_guard<mutex> lock(mtx);
            trabajos.push(buffer);
        }
        cv.notify_one();
    }

    if (!restoPalabra.empty())
    {
        {
            lock_guard<mutex> lock(mtx);
            trabajos.push(restoPalabra);
        }
        cv.notify_one();
    }

    {
        lock_guard<mutex> lock(mtx);
        terminados = true;
    }
    cv.notify_all();

    for (auto &hilo : hilos)
    {
        hilo.join();
    }

    vector<pair<string, int>> conteoOrdenado(conteoGlobal.begin(), conteoGlobal.end());
    sort(conteoOrdenado.begin(), conteoOrdenado.end());

    for (const auto &p : conteoOrdenado)
    {
        cout << p.first << ": " << p.second << "\n";
    }

    return 0;
}
