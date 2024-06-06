
# Reporte de Resultados

## 1. Implementación del Programa en C

### 1.1. Programa Original

El programa original sin modificaciones está en `original.cpp`.

### 1.2. Programa Modificado para el Cálculo de π en Paralelo

#### 1.2.1. Cola Segura para Concurrencia

El programa modificado para usar una cola segura para concurrencia está en `cola.cpp`.

#### 1.2.2. Message Queue

El programa modificado para usar message queue está en `queue.cpp`.

#### 1.2.3. Pipe

El programa modificado para usar pipe está en `pipe.cpp`.

#### 1.2.4. Boost.Fiber

El programa modificado para usar Boost.Fiber está en `boost_fiber.cpp`.

## 2. Instrucciones de Compilación

Para compilar los programas, puedes usar los siguientes comandos:

### Compilar el Programa Original

```sh
gcc -o original original.cpp -pthread -lm
```

### Compilar el Programa con Cola para Concurrencia

```sh
gcc -o cola cola.cpp -pthread -lm
```

### Compilar el Programa con Message Queue

```sh
gcc -o queue queue.cpp -pthread -lm
```

### Compilar el Programa con Pipe

```sh
gcc -o pipe pipe.cpp -pthread -lm
```

### Compilar el Programa con Boost.Fiber

```sh
g++ -o boost_fiber boost.Fiber.cpp -lboost_system -lboost_thread -lboost_context -lboost_fiber -lpthread -std=c++11
```

### Resultados de las Pruebas de Concurrencia

#### Problemas en Queue.cpp y Pipe.cpp

##### Problema:
Se detectaron problemas de carrera de datos al acceder a la variable points_inside_circle desde múltiples hilos.

##### Solución:
Se protegió el acceso a la variable points_inside_circle utilizando un mutex para asegurar que solo un hilo pueda acceder a la variable a la vez.


## 4. Pruebas de Desempeño

### Ejecución con Diferentes Cantidades de Puntos y Hilos

#### Resultados

| Programa     | Total de Puntos | Total de Hilos | Tiempo de Ejecución (s) | Valor de Pi |
|--------------|-----------------|----------------|-------------------------|-------------|
| original     | 1000000         | 4              | 0.017                   | 0.785852    |
| cola         | 1000000         | 4              | 0.005                   | 3.14486     |
| pipe         | 1000000         | 4              | 0.010                   | 3.141424    |
| queue        | 1000000         | 4              | 0.008                   | 3.138704    |
| boost_fiber  | 1000000         | 4              | 0.106                   | 3.13753     |
| original     | 1000000         | 8              | 0.010                   | 0.392044    |
| cola         | 1000000         | 8              | 0.011                   | 3.14429     |
| pipe         | 1000000         | 8              | 0.007                   | 3.139680    |
| queue        | 1000000         | 8              | 0.006                   | 3.142720    |
| boost_fiber  | 1000000         | 8              | 0.121                   | 3.14387     |
| original     | 1000000         | 16             | 0.003                   | 0.197064    |
| cola         | 1000000         | 16             | 0.008                   | 3.144       |
| pipe         | 1000000         | 16             | 0.007                   | 3.147136    |
| queue        | 1000000         | 16             | 0.008                   | 3.124672    |
| boost_fiber  | 1000000         | 16             | 0.106                   | 3.14347     |
