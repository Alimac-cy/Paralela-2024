/**/
#include <stdio.h>

void add_vectors(int *a, int *b, int *result, int n)
{
    for (int i = 0; i < n; i++)
    {
        result[i] = a[i] + b[i];
    }
}

int main()
{
    int a[4] = {1, 2, 3, 4};
    int b[4] = {5, 6, 7, 8};
    int result[4];
    add_vectors(a, b, result, 4);
    for (int i = 0; i < 4; i++)
    {
        printf("%d ", result[i]);
    }
    printf("\n");
    return 0;
}
