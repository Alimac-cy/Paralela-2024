/* Investigue el funcionamiento de la función _mm_hadd_epi32. Una vez que entienda cómo
funciona, implemente una función que sume todos los elementos de un array. Igual que
en el resto de la práctica, considere arrays de int32_t y reciba el tamaño en un size_t.
Sume los elementos de 4 en 4 usando _mm_add_epi32, luego sume el resultado
acumulado en el registro SSE usando la suma parcial del código anterior. Finalmente,
sume los elementos que no pudo procesar usando SIMD.*/
#include <stdio.h>
#include <immintrin.h>
#include <stddef.h>
#include <stdint.h>

int suma_total_SIMD(const int32_t *array, size_t tam)
{
    __m128i suma = _mm_setzero_si128();
    size_t i;
    for (i = 0; i + 4 <= tam; i += 4)
    {
        __m128i valores = _mm_loadu_si128((__m128i *)&array[i]);
        suma = _mm_add_epi32(suma, valores);
    }
    suma = _mm_hadd_epi32(suma, suma);
    suma = _mm_hadd_epi32(suma, suma);
    int resultado = _mm_extract_epi32(suma, 0);
    for (; i < tam; ++i)
    {
        resultado += array[i];
    }
    return resultado;
}

int main()
{
    int32_t array[] = {1, 2, 3, 4, 5, 6, 7, 8};
    size_t tam = sizeof(array) / sizeof(array[0]);
    int suma = suma_total_SIMD(array, tam);
    printf("Suma total: %d\n", suma);

    return 0;
}
