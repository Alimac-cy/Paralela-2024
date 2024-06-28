

## Documentación

### a. Explicación detallada del funcionamiento de su proyecto

El programa implementa el algoritmo PageRank de manera paralela. Lee un archivo de entrada que contiene un grafo dirigido, calcula el PageRank de cada nodo de manera iterativa y paralela, y escribe los resultados en un archivo de salida.

1. **Carga del Grafo**: La función `cargar_grafo` lee el archivo de entrada en trozos y procesa cada trozo asíncronamente usando la función `cargar_grafo_parcial`.
2. **Inicialización del PageRank**: La función `inicializar_pagerank` asigna un valor inicial igual para todos los nodos.
3. **Cálculo del PageRank**: La función `calcular_pagerank` divide el cálculo en partes que se procesan en paralelo. La función `calcular_pagerank_parcial` realiza el cálculo para una porción del grafo.
4. **Escritura del Resultado**: La función `escribir_pagerank` escribe los valores calculados del PageRank en un archivo de salida con una precisión de 6 decimales.

#### . Paralelizar correctamente la ejecución

El programa divide el cálculo de PageRank en partes que se procesan en paralelo usando hilos (`std::thread` y `std::async`). Cada hilo procesa una porción del grafo, asegurando que la carga de trabajo se distribuye equitativamente entre los hilos disponibles.

#### . No hay fugas de memoria ni accesos inválidos detectados por Valgrind

El programa se asegura de no tener fugas de memoria ni accesos inválidos utilizando estructuras estándar de C++ (`std::vector`, `std::unordered_map`) y protegiendo el acceso concurrente con mutexes (`std::mutex`).

### b. Explicación detallada de cómo compilar el proyecto

Para compilar el proyecto:
```sh
 g++ -pthread page.cpp -o page
```

### c. Explicación detallada de cómo correrlo

Para ejecutar el programa:
```sh
./page -src <archivo_entrada> -dst <archivo_salida>
```
ejemplo:
```sh
./page -src input.txt -dst output.txt
```

### d. Explicación detallada de los límites de su proyecto

1. **Tamaño del Grafo**: El tamaño máximo del grafo está limitado por la memoria disponible en el sistema.
2. **Precisión**: La precisión de los valores de PageRank se ajusta a 6 decimales.

### e. Explicación detallada de los problemas conocidos con su proyecto

1. **Distribución Desigual de la Carga**: Aunque el programa intenta distribuir la carga de manera equitativa entre los hilos, en algunos casos, los hilos pueden no tener exactamente la misma cantidad de trabajo.
2. **Convergencia**: Si el grafo es extremadamente grande, puede que el programa no converja dentro de las 100 iteraciones fijadas.
3. **Uso de Memoria**: Para grafos muy grandes, el uso de memoria puede ser considerable, lo que puede llevar a problemas en sistemas con poca memoria disponible.
