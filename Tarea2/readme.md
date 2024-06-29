# Reporte de Resultados

## 1. Implementación del Programa en C

### 1.1. Programa Original

El programa original sin modificaciones está en `original.c`.

### 1.2. Programa Modificado para el Cálculo de π en Paralelo

#### 1.2.1. Cola Segura para Concurrencia

El programa modificado para usar una cola segura para concurrencia está en `ejercicio1y2.c`.

#### 1.2.2. Message Queue

El programa modificado para usar message queue está en `ejercicio1y2.c`.

#### 1.2.3. Pipe

El programa modificado para usar pipe está en `ejercicio3.c`.

#### 1.2.4. Boost.Fiber

El programa modificado para usar Boost.Fiber está en `ejercicio4.c`.

## 2. Instrucciones de Compilación

Para compilar los programas, puedes usar los siguientes comandos:

### Compilar el Programa Original

```sh
gcc -o original original.c -lm -lpthread
```

### Compilar el Programa con Cola para Concurrencia y Message Queue

```sh
gcc -o ejercicio1y2 ejercicio1y2.c -lm -lpthread
```

### Compilar el Programa con Pipe

```sh
gcc -o ejercicio3 ejercicio3.c -lm -lpthread
```

### Compilar el Programa con Boost.Fiber

```sh
g++ -o ejercicio4 ejercicio4.c -lboost_system -lboost_fiber -lpthread
```

## 3. Pruebas de Concurrencia

### Problemas en `ejercicio1y2.c` y `ejercicio3.c`

#### Problema:
Se detectaron problemas de datos sin inicializar en `ejercicio1y2.c` al enviar mensajes a la cola de mensajes.

### Resultados de Valgrind

#### Programa Original

```sh
valgrind ./original 100000000 4
```

#### Ejercicio 1 y 2

```sh
valgrind ./ejercicio1y2 100000000 4
```

Resultado:

```plaintext
==183798== Syscall param msgsnd(msgp->mtext) points to uninitialised byte(s)
```

#### Ejercicio 3

```sh
valgrind ./ejercicio3 100000000 4
```

#### Ejercicio 4

```sh
valgrind ./ejercicio4 100000000 4
```

## 4. Pruebas de Desempeño

### Ejecución con Diferentes Cantidades de Puntos y Hilos

#### Resultados

| Programa     | Total de Puntos | Total de Hilos | Tiempo de Ejecución (s) | Valor de Pi |
|--------------|-----------------|----------------|-------------------------|-------------|
| original     | 100000000       | 4              | 0.366                   | 0.785424    |
| ejercicio1y2 | 100000000       | 4              | 0.548                   | 3.141618    |
| ejercicio3   | 100000000       | 4              | 0.518                   | 3.141655    |
| ejercicio4   | 100000000       | 4              | 0.558                   | 3.141922    |
| original     | 100000000       | 8              | 0.180                   | 0.392771    |
| ejercicio1y2 | 100000000       | 8              | 0.330                   | 3.141751    |
| ejercicio3   | 100000000       | 8              | 0.359                   | 3.141040    |
| ejercicio4   | 100000000       | 8              | 0.358                   | 3.141597    |
| original     | 100000000       | 16             | 0.099                   | 0.196394    |
| ejercicio1y2 | 100000000       | 16             | 0.355                   | 3.141842    |
| ejercicio3   | 100000000       | 16             | 0.360                   | 3.140956    |
| ejercicio4   | 100000000       | 16             | 0.296                   | 3.141532    |

### Observaciones:

1. **Programa Original**: El tiempo de ejecución es menor, pero el valor de π no es preciso debido a la falta de paralelismo.
2. **ejercicio1y2 (Cola para Concurrencia y Message Queue)**: El valor de π es preciso y el tiempo de ejecución aumenta ligeramente debido a la sincronización.
3. **ejercicio3 (Pipe)**: El valor de π es preciso y el tiempo de ejecución es similar al de `ejercicio1y2`.
4. **ejercicio4 (Boost.Fiber)**: El valor de π es preciso y el tiempo de ejecución es comparable al de los otros métodos, demostrando que Boost.Fiber es una alternativa viable para la programación concurrente.