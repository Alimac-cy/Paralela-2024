#include <iostream>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <pthread.h>
#include <ctime>
#include <atomic>
#include <condition_variable>
#include <mutex>

#define MAX_THREADS 50000

class Queue
{
public:
    Queue(int capacity) : capacity(capacity), size(0), front(0), rear(0)
    {
        buffer.resize(capacity);
    }

    void push(int value)
    {
        std::unique_lock<std::mutex> lock(mutex);
        buffer[rear] = value;
        rear = (rear + 1) % capacity;
        size++;
        not_empty.notify_one();
    }

    int pop()
    {
        std::unique_lock<std::mutex> lock(mutex);
        not_empty.wait(lock, [this]
                       { return size > 0; });
        int value = buffer[front];
        front = (front + 1) % capacity;
        size--;
        return value;
    }

private:
    std::vector<int> buffer;
    int capacity;
    int size;
    int front;
    int rear;
    std::mutex mutex;
    std::condition_variable not_empty;
};

int total_threads;
int total_points;

void *throw_darts(void *arg)
{
    int childID = (intptr_t)arg;
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
    static_cast<Queue *>(arg)->push(points_inside_circle);
    return NULL;
}

int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        std::cerr << "Uso: " << argv[0] << " <total_points> <total_threads>\n";
        return 1;
    }
    total_points = std::atoi(argv[1]);
    total_threads = std::atoi(argv[2]);
    if (total_threads > MAX_THREADS)
    {
        std::cerr << "El número de hilos no puede ser mayor a " << MAX_THREADS << "\n";
        return 1;
    }
    if (total_points % total_threads != 0)
    {
        std::cerr << "El número de puntos debe ser divisible entre el número de hilos\n";
        return 1;
    }

    pthread_t threads[total_threads];
    Queue queue(total_threads);

    for (int i = 0; i < total_threads; i++)
    {
        pthread_create(&threads[i], NULL, throw_darts, (void *)&queue);
    }

    int total_points_inside_circle = 0;
    for (int i = 0; i < total_threads; i++)
    {
        total_points_inside_circle += queue.pop();
    }

    for (int i = 0; i < total_threads; i++)
    {
        pthread_join(threads[i], NULL);
    }

    double pi = 4.0 * total_points_inside_circle / total_points;
    std::cout << "Valor de pi: " << pi << "\n";

    return 0;
}
