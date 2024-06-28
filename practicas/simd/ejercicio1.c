#include <stdio.h>
#include <stdint.h>
#include <immintrin.h>
int main()
{
    int32_t a[4] = {1, 2, 3, 4};
    int32_t b[4] = {5, 6, 7, 8};
    int32_t result[4];
    __m128i va = _mm_loadu_si128((__m128i *)a);
    __m128i vb = _mm_loadu_si128((__m128i *)b);
    __m128i vresult = _mm_add_epi32(va, vb);
    _mm_storeu_si128((__m128i *)result, vresult);
    for (size_t i = 0; i < 4; i++)
    {
        printf("%d ", result[i]);
    }
    return 0;
}
