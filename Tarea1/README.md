

## Tarea 1 

## Reporte de resultados:

### Instrucciones de compilación:

Para compilar estos programas, puedes usar el compilador de C++ (g++):

```bash
g++ -o monteConMutexFuera monteConMutexFuera.cpp
g++ -o monteConMutexDentro monteConMutexDentro.cpp
g++ -o monteSinMutex monteSinMutex.cpp
g++ -o monteRetorno monteRetorno.cpp
```

El programa monteAtomico.c está escrito en C, por lo que utilizamos el compilador de C (gcc) y también incluimos la bandera `-lm` para enlazar la biblioteca matemática.

```bash
gcc -o monteAtomico monteAtomico.c -lm
```

### Pruebas con Helgrind o ThreadSanitizer

ThreadSanitizer no mostro ningun error mas que en 1.2.1.

### Resultados de pruebas con diferentes cantidades de puntos y hilos

| Programa             | Puntos         | Hilos | Número Pi | Tiempo Real (s) |
|----------------------|----------------|-------|-----------|-----------------|
| monteConMutexFuera   | 100,000        | 1     | 3.137000  | 0.039           |
| monteConMutexFuera   | 100,000        | 2     | 3.138120  | 0.015           |
| monteConMutexFuera   | 1,000,000      | 4     | 3.139976  | 0.046           |
| monteConMutexFuera   | 10,000,000     | 8     | 3.141042  | 0.295           |
| monteConMutexDentro  | 100,000        | 1     | 3.142800  | 0.042           |
| monteConMutexDentro  | 100,000        | 2     | 3.145560  | 0.069           |
| monteConMutexDentro  | 1,000,000      | 4     | 3.142588  | 0.953           |
| monteConMutexDentro  | 10,000,000     | 8     | 3.141292  | 23.624          |
| monteSinMutex        | 100,000        | 1     | 3.151360  | 0.012           |
| monteSinMutex        | 100,000        | 2     | 2.043480  | 0.005           |
| monteSinMutex        | 1,000,000      | 4     | 1.136400  | 0.015           |
| monteSinMutex        | 10,000,000     | 8     | 0.475098  | 0.074           |
| monteRetorno         | 100,000        | 1     | 3.147960  | 0.021           |
| monteRetorno         | 100,000        | 2     | 3.154000  | 0.015           |
| monteRetorno         | 1,000,000      | 4     | 3.145092  | 0.040           |
| monteRetorno         | 10,000,000     | 8     | 3.141331  | 0.293           |
| monteAtomico         | 100,000        | 1     | 3.126240  | 0.054           |
| monteAtomico         | 100,000        | 2     | 3.132440  | 0.030           |
| monteAtomico         | 1,000,000      | 4     | 3.138096  | 0.279           |
| monteAtomico         | 10,000,000     | 8     | 3.140478  | 4.639           |

### Comparación de velocidad con diferentes cantidades de puntos y hilos

| Programa             | Puntos         | Hilos | Tiempo Real (s) |
|----------------------|----------------|-------|-----------------|
| monteConMutexFuera   | 1,000,000,000  | 1     | 120.336         |
| monteConMutexFuera   | 1,000,000,000  | 4     | 49.749          |
| monteConMutexFuera   | 1,000,000,000  | 8     | 41.920          |
| monteConMutexDentro  | 1,000,000,000  | 1     | 354.585         |
| monteConMutexDentro  | 1,000,000,000  | 4     | 1346.946        |
| monteConMutexDentro  | 1,000,000,000  | 8     | No completado   |
| monteRetorno         | 1,000,000,000  | 1     | 118.548         |
| monteRetorno         | 1,000,000,000  | 4     | 48.621          |
| monteRetorno         | 1,000,000,000  | 8     | 40.625          |
| monteAtomico         | 1,000,000,000  | 1     | 278.000         |
| monteAtomico         | 1,000,000,000  | 4     | 378.004         |
| monteAtomico         | 1,000,000,000  | 8     | 630.361         |
| monteSinMutex        | 1,000,000,000  | 1     | 13.945          |
| monteSinMutex        | 1,000,000,000  | 4     | 9.365           |
| monteSinMutex        | 1,000,000,000  | 8     | No completado   |

La implementación con mutex fuera del ciclo es la más rápida, seguida por la implementación sin mutex (significativamente menos confiable). Las implementaciones con mutex dentro del ciclo y la implementación atómica parecen ser más lentas en comparación. 
