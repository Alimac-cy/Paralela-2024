#include <stdio.h>
#include <pthread.h>

#define NUM_THREADS 16

struct arguments
{
    int a;
    int b;
};

void *sum(void *arg)
{
    struct arguments *args = (struct arguments *)arg;
    int result = args->a + args->b;
    printf("Result: %d\n", result);
    pthread_exit(NULL);
}

int main(void)
{
    pthread_t threads[NUM_THREADS];
    struct arguments args[NUM_THREADS];

    for (int i = 0; i < NUM_THREADS; i++)
    {
        args[i].a = i;
        args[i].b = i * 2;
        if (pthread_create(&threads[i], NULL, sum, &args[i]) != 0)
        {
            perror("Error creating thread\n");
            return 1;
        }
    }

    for (int i = 0; i < NUM_THREADS; i++)
    {
        pthread_join(threads[i], NULL);
    }

    return 0;
}
