#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>
#include <math.h>
#include <stdint.h>

#define MAX_THREADS 50000

typedef struct
{
    int *buffer;
    int capacity;
    int size;
    int front;
    int rear;
    pthread_mutex_t mutex;
    pthread_cond_t not_empty;
} Queue;

void queue_init(Queue *q, int capacity)
{
    q->buffer = (int *)malloc(capacity * sizeof(int));
    q->capacity = capacity;
    q->size = 0;
    q->front = 0;
    q->rear = 0;
    pthread_mutex_init(&q->mutex, NULL);
    pthread_cond_init(&q->not_empty, NULL);
}

void queue_destroy(Queue *q)
{
    free(q->buffer);
    pthread_mutex_destroy(&q->mutex);
    pthread_cond_destroy(&q->not_empty);
}

void queue_push(Queue *q, int value)
{
    pthread_mutex_lock(&q->mutex);
    q->buffer[q->rear] = value;
    q->rear = (q->rear + 1) % q->capacity;
    q->size++;
    pthread_cond_signal(&q->not_empty);
    pthread_mutex_unlock(&q->mutex);
}

int queue_pop(Queue *q)
{
    pthread_mutex_lock(&q->mutex);
    while (q->size == 0)
    {
        pthread_cond_wait(&q->not_empty, &q->mutex);
    }
    int value = q->buffer[q->front];
    q->front = (q->front + 1) % q->capacity;
    q->size--;
    pthread_mutex_unlock(&q->mutex);
    return value;
}

int total_threads;
int total_points;

pthread_mutex_t points_mutex = PTHREAD_MUTEX_INITIALIZER;

void *throw_darts(void *arg)
{
    int childID = (uintptr_t)arg;
    int points_per_thread = total_points / total_threads;
    unsigned int seed = time(NULL) * (childID + 1);
    int points_inside_circle = 0;
    for (int i = 0; i < points_per_thread; i++)
    {
        double x = (double)rand_r(&seed) / RAND_MAX;
        double y = (double)rand_r(&seed) / RAND_MAX;
        if (sqrt(x * x + y * y) <= 1)
        {
            points_inside_circle++;
        }
    }
    pthread_mutex_lock(&points_mutex);
    queue_push((Queue *)arg, points_inside_circle);
    pthread_mutex_unlock(&points_mutex);
    return NULL;
}

int main(int argc, char *argv[])
{
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

    pthread_t threads[total_threads];
    Queue queue;
    queue_init(&queue, total_threads);

    for (int i = 0; i < total_threads; i++)
    {
        pthread_create(&threads[i], NULL, throw_darts, (void *)&queue);
    }

    int total_points_inside_circle = 0;
    for (int i = 0; i < total_threads; i++)
    {
        total_points_inside_circle += queue_pop(&queue);
    }

    for (int i = 0; i < total_threads; i++)
    {
        pthread_join(threads[i], NULL);
    }

    double pi = 4.0 * total_points_inside_circle / total_points;
    printf("Valor de pi: %f\n", pi);

    queue_destroy(&queue);
    return 0;
}
