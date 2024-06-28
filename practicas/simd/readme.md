```markdown
# Instrucciones de Compilación

### Ejercicio 1: Introducción a SIMD

```sh
gcc -o ejercicio1 ejercicio1.c -march=native -O3
```

### Ejercicio 2: Resta de vectores

```sh
gcc -o ejercicio2 ejercicio2.c -march=native -O3
```

### Ejercicio 3: Producto punto

```sh
gcc -o ejercicio3 ejercicio3.c -march=native -O3
```

### Ejercicio 4: Carga y almacenamiento alineados

```sh
gcc -o ejercicio4 ejercicio4.c -march=native -O3
```

### Ejercicio 5: Multiplicación de matrices 2x2

```sh
gcc -o ejercicio5 ejercicio5.c -march=native -O3
```

### Ejercicio 6: Mayor elemento de un array

**Versión sin optimización (-O0):**

```sh
gcc -o ejercicio6Tradicional_O0 ejercicio6Tradicional.c -O0
```

**Versión con optimización (-O3):**

```sh
gcc -o ejercicio6Tradicional_O3 ejercicio6Tradicional.c -O3 -ftree-vectorize -fopt-info-vec-optimized
```

**Versión SIMD:**

```sh
gcc -o ejercicio6simd ejercicio6simd.c -march=native -O3
```

### Ejercicio 7: Multiplicación escalar

**Versión sin optimización (-O0):**

```sh
gcc -o ejercicio7Trad_O0 ejercicio7Trad.c -O0
```

**Versión con optimización (-O3):**

```sh
gcc -o ejercicio7Trad_O3 ejercicio7Trad.c -O3 -ftree-vectorize -fopt-info-vec-optimized
```

**Versión SIMD:**

```sh
gcc -o ejercicio7simd ejercicio7simd.c -march=native -O3
```

### Ejercicio 8: Autovectorización

**Versión sin optimización (-O0):**

```sh
gcc -o ejercicio8_O0 ejercicio8.c -O0
```

**Versión con optimización (-O3):**

```sh
gcc -o ejercicio8_O3 ejercicio8.c -O3 -ftree-vectorize -fopt-info-vec-optimized
```

### Ejercicio 9: Reducción paralela

```sh
gcc -o ejercicio9 ejercicio9.c -march=native -O3
```

### Ejercicio 6: Mayor elemento de un array

#### Comparación de tiempos de ejecución

- **Sin optimización (-O0):**
  ```sh
  time ./ejercicio6Tradicional_O0
  ```
  Resultado:
  ```
  tradicional: 13

  real    0m0.016s
  user    0m0.001s
  sys     0m0.000s
  ```

- **Con optimización (-O3):**
  ```sh
  time ./ejercicio6Tradicional_O3
  ```
  Resultado:
  ```
  tradicional: 13

  real    0m0.055s
  user    0m0.002s
  sys     0m0.000s
  ```

### Ejercicio 7: Multiplicación escalar

#### Comparación de tiempos de ejecución

- **Sin optimización (-O0):**
  ```sh
  time ./ejercicio7Trad_O0
  ```
  Resultado:
  ```
  2 4 6 8 10 12 14 16

  real    0m0.001s
  user    0m0.000s
  sys     0m0.000s
  ```

- **Con optimización (-O3):**
  ```sh
  time ./ejercicio7Trad_O3
  ```
  Resultado:
  ```
  2 4 6 8 10 12 14 16

  real    0m0.001s
  user    0m0.001s
  sys     0m0.000s
  ```

- **Versión SIMD:**
  ```sh
  time ./ejercicio7simd
  ```
  Resultado:
  ```
  2 4 6 8 10 12 14 16

  real    0m0.001s
  user    0m0.000s
  sys     0m0.000s
  ```

### Ejercicio 6: Mayor elemento de un array (SIMD)

- **Versión SIMD:**
  ```sh
  time ./ejercicio6simd
  ```
  Resultado:
  ```
  SIMD: 13

  real    0m0.001s
  user    0m0.001s
  sys     0m0.000s
  ```

### Conclusión

- **Ejercicio 6:**
  - La versión optimizada (-O3) tomó más tiempo (`real`, `user`) en comparación con la versión sin optimización (-O0). Esto puede deberse a varios factores, incluyendo la sobrecarga del sistema durante la medición.
  - La versión SIMD fue significativamente más rápida que ambas versiones tradicionales.

- **Ejercicio 7:**
  - Los tiempos de ejecución para las versiones sin y con optimización (-O0 y -O3) fueron prácticamente iguales.
  - La versión SIMD también mostró un tiempo de ejecución similar, lo que sugiere que para este tamaño de array, la optimización no tiene un impacto significativo en el tiempo de ejecución. 

Para notar una diferencia más clara en los tiempos de ejecución, es recomendable probar con arrays de mayor tamaño.