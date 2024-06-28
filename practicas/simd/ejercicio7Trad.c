#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

void multiplicacion_escalar_tradicional(int32_t *array, size_t tam, int32_t escalar)
{
    for (size_t i = 0; i < tam; ++i)
    {
        array[i] *= escalar;
    }
}

int main()
{
    int32_t vector[] = {1, 2, 3, 4, 5, 6, 7, 8};
    size_t tam = sizeof(vector) / sizeof(vector[0]);
    int32_t escalar = 2;
    multiplicacion_escalar_tradicional(vector, tam, escalar);
    for (size_t i = 0; i < tam; ++i)
    {
        printf("%d ", vector[i]);
    }
    printf("\n");

    return 0;
}
