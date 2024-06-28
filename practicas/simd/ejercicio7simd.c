/*Implemente la multiplicación por un escalar. Cree tanto una versión que use SIMD como
una tradicional. Ambas funciones deben recibir un array de int32_t (importen limits.h) y un
size_t con el tamaño del array. Utilicen _mm_loadu_si128 para cargar los datos,
_mm_set1_epi32 para guardar el escalar en cada posición del registro, _mm_mullo_epi32
para realizar la multiplicación y finalmente _mm_storeu_si128 para guardar el resultado al
array.
Compile el programa y luego decompílelo usando objdump -d. Observe las diferencias en
el código generado. ¿El compilador logró optimizar la versión “tradicional”?*/

#include <immintrin.h>
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

void multiplicacion_escalar_SIMD(int32_t *array, size_t tam, int32_t escalar)
{
    __m128i v_escalar = _mm_set1_epi32(escalar);
    size_t i;
    for (i = 0; i + 4 <= tam; i += 4)
    {
        __m128i valores = _mm_loadu_si128((__m128i *)&array[i]);
        __m128i resultado = _mm_mullo_epi32(valores, v_escalar);
        _mm_storeu_si128((__m128i *)&array[i], resultado);
    }
    for (; i < tam; ++i)
    {
        array[i] *= escalar;
    }
}

int main()
{
    int32_t vector[] = {1, 2, 3, 4, 5, 6, 7, 8};
    size_t tam = sizeof(vector) / sizeof(vector[0]);
    int32_t escalar = 2;

    multiplicacion_escalar_SIMD(vector, tam, escalar);

    for (size_t i = 0; i < tam; ++i)
    {
        printf("%d ", vector[i]);
    }
    printf("\n");

    return 0;
}
