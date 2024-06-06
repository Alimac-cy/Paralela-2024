#include <boost/fiber/all.hpp>
#include <iostream>
#include <random>
#include <cmath>

const int MAX_THREADS = 50000;
int total_threads;
int total_points;

void throw_darts(boost::fibers::buffered_channel<int> &channel, int points_per_thread, int seed)
{
    std::default_random_engine generator(seed);
    std::uniform_real_distribution<double> distribution(0.0, 1.0);
    int points_inside_circle = 0;
    for (int i = 0; i < points_per_thread; i++)
    {
        double x = distribution(generator);
        double y = distribution(generator);
        if (std::sqrt(x * x + y * y) <= 1.0)
        {
            points_inside_circle++;
        }
    }
    channel.push(points_inside_circle);
}

int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        std::cerr << "Uso: " << argv[0] << " <total_points> <total_threads>\n";
        return 1;
    }
    total_points = std::stoi(argv[1]);
    total_threads = std::stoi(argv[2]);
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

    boost::fibers::buffered_channel<int> channel(total_threads);
    int points_per_thread = total_points / total_threads;

    for (int i = 0; i < total_threads; i++)
    {
        boost::fibers::fiber(throw_darts, std::ref(channel), points_per_thread, time(nullptr) * (i + 1)).detach();
    }

    int total_points_inside_circle = 0;
    for (int i = 0; i < total_threads; i++)
    {
        int points_inside_circle;
        channel.pop(points_inside_circle);
        total_points_inside_circle += points_inside_circle;
    }

    double pi = 4.0 * total_points_inside_circle / total_points;
    std::cout << "Valor de pi: " << pi << "\n";

    return 0;
}
