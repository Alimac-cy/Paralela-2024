#include <immintrin.h>
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

int32_t maximo_SIMD(const int32_t *array, size_t tam)
{
    __m128i max_valores = _mm_set1_epi32(INT32_MIN);
    size_t i;
    for (i = 0; i + 4 <= tam; i += 4)
    {
        __m128i valores = _mm_load_si128((__m128i *)&array[i]);
        max_valores = _mm_max_epi32(max_valores, valores);
    }
    int32_t max_array[4];
    _mm_storeu_si128((__m128i *)max_array, max_valores);

    int32_t max_valor = INT32_MIN;
    for (size_t j = 0; j < 4; ++j)
    {
        if (max_array[j] > max_valor)
        {
            max_valor = max_array[j];
        }
    }
    for (; i < tam; ++i)
    {
        if (array[i] > max_valor)
        {
            max_valor = array[i];
        }
    }

    return max_valor;
}
int main()
{
    __attribute__((aligned(16))) int32_t vector[] = {1, 6, 4, 3, 13, 7, 8, 9, 11};
    size_t tam = sizeof(vector) / sizeof(vector[0]);
    int32_t max_SIMD = maximo_SIMD(vector, tam);
    printf("SIMD: %d\n", max_SIMD);

    return 0;
}
