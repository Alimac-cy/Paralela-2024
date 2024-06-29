#include <math.h>
#include <pthread.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <boost/fiber/all.hpp>

#define MAX_THREADS 50000

int total_threads;
int total_points;

void throw_darts(int points_per_thread, boost::fibers::buffered_channel<int> *channel)
{
    int local_points = 0;
    unsigned int seed = time(NULL) * (uintptr_t)pthread_self();
    for (int i = 0; i < points_per_thread; i++)
    {
        double x = (double)rand_r(&seed) / RAND_MAX;
        double y = (double)rand_r(&seed) / RAND_MAX;
        if (sqrt(x * x + y * y) <= 1)
        {
            local_points++;
        }
    }
    channel->push(local_points);
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

    int points_per_thread = total_points / total_threads;
    boost::fibers::buffered_channel<int> channel(total_threads);
    std::vector<std::thread> threads;
    for (int i = 0; i < total_threads; ++i)
    {
        threads.emplace_back([points_per_thread, &channel]
                             { throw_darts(points_per_thread, &channel); });
    }

    int points_inside_circle = 0;
    for (int i = 0; i < total_threads; ++i)
    {
        int local_points;
        channel.pop(local_points);
        points_inside_circle += local_points;
    }

    for (auto &t : threads)
    {
        t.join();
    }
    double pi = 4.0 * points_inside_circle / total_points;
    printf("Valor estimado de pi: %f\n", pi);

    return 0;
}
