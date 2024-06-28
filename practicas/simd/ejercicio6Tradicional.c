#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

int32_t maximo_tradicional(const int32_t *array, size_t tam) {
    int32_t max_valor = INT32_MIN;
    for (size_t i = 0; i < tam; ++i) {
        if (array[i] > max_valor) {
            max_valor = array[i];
        }
    }
    return max_valor;
}

int main() {
    int32_t vector[] = {1, 6, 4, 3, 13, 7, 8, 9, 11};
    size_t tam = sizeof(vector) / sizeof(vector[0]);

    int32_t max_trad = maximo_tradicional(vector, tam);
    printf("tradicional: %d\n", max_trad);

    return 0;
}
