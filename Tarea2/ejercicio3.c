#include <math.h>
#include <pthread.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

#define MAX_THREADS 50000
pthread_mutex_t mutex;
int total_threads;
int points_inside_circle = 0;
int total_points;

void *throw_darts(void *arg)
{
    int *pipefds = (int *)arg;
    int local_points = 0;
    int childID = (uintptr_t)arg;
    int points_per_thread = total_points / total_threads;
    unsigned int seed = time(NULL) * (childID + 1);

    for (int i = 0; i < points_per_thread; i++)
    {
        double x = (double)rand_r(&seed) / RAND_MAX;
        double y = (double)rand_r(&seed) / RAND_MAX;
        if (sqrt(x * x + y * y) <= 1)
        {
            local_points++;
        }
    }
    pthread_mutex_lock(&mutex);
    write(pipefds[1], &local_points, sizeof(local_points));
    printf("Puntos enviados: %d\n", local_points);
    pthread_mutex_unlock(&mutex);
    return NULL;
}
int main(int argc, char *argv[])
{
    pthread_t threads[MAX_THREADS];

    if (argc != 3)
    {
        printf("Uso: %s <total_points> <total_threads>\n", argv[0]);
        return 1;
    }
    total_points = atoi(argv[1]);
    total_threads = atoi(argv[2]);

    if (total_threads > MAX_THREADS)
    {
        printf("El número de hilos no puede ser mayor a %d\n", MAX_THREADS);
        return 1;
    }
    if (total_points % total_threads != 0)
    {
        printf("El número de puntos debe ser divisible entre el número de hilos\n");
        return 1;
    }
    int pipefds[2];
    if (pipe(pipefds) == -1)
    {
        perror("Error creating pipe");
        exit(EXIT_FAILURE);
    }

    pthread_mutex_init(&mutex, NULL);

    for (int i = 0; i < total_threads; i++)
    {
        pthread_create(&threads[i], NULL, throw_darts, (void *)pipefds);
    }
    for (int i = 0; i < total_threads; i++)
    {
        pthread_join(threads[i], NULL);
    }
    points_inside_circle = 0;
    close(pipefds[1]);
    for (int i = 0; i < total_threads; i++)
    {
        int local_points = 0;
        read(pipefds[0], &local_points, sizeof(local_points));
        points_inside_circle += local_points;
    }

    close(pipefds[0]);
    double pi = 4.0 * points_inside_circle / total_points;
    printf("Valor de pi: %f\n", pi);
    pthread_mutex_destroy(&mutex);
    return 0;
}
