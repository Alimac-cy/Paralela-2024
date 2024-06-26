// Written by Barry Wilkinson, UNC - Charlotte.Pi.cu December 22,2010.
// Derived somewhat from code developed by Patrick Rogers, UNC-C
#include <stdlib.h>
#include <stdio.h>
#include <cuda.h>
#include <math.h>
#include <time.h>
#include <curand_kernel.h>
#define TRIALS_PER_THREAD 4096
#define BLOCKS 256
#define THREADS 256
#define PI 3.1415926535 // known value of pi
__global__ void gpu_monte_carlo(float *estimate, curandState *states)
{
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int points_in_circle = 0;
    float x, y;
    curand_init(1234, tid, 0, &states[tid]);
    curandState localState = states[tid];

    for (int i = 0; i < TRIALS_PER_THREAD; i++)
    {
        // Generate random numbers
        x = curand_uniform(&localState) ;
        y = curand_uniform(&localState) ;

        points_in_circle += (x * x + y * y <= 1.0f); // Count if (x, y) is in the circle.
    }

    states[tid] = localState;

    estimate[tid] = 4.0f * points_in_circle / (float)TRIALS_PER_THREAD; // Return estimate of pi
}

float host_monte_carlo(long trials)
{
    float x, y;
    long points_in_circle;
    for (long i = 0; i < trials; i++)
    {
        x = rand() / (float)RAND_MAX;
        y = rand() / (float)RAND_MAX;
        points_in_circle += (x * x + y * y <= 1.0f);
    }
    return 4.0f * points_in_circle / trials;
}
int main(int argc, char *argv[])
{
    clock_t start, stop;
    float host[BLOCKS * THREADS];
    float *dev;
    curandState *devStates;
    printf("# of trials per thread = %d, # of blocks = %d, # of threads / block = % d.\n ", TRIALS_PER_THREAD, BLOCKS, THREADS);
    start = clock();
    // TODO: use cudaMalloc para pedir un bloque de memoria de tamaño BLOCKS *THREADS * sizeof(float).Guárdelo en dev.
    // TODO: use cudaMalloc para pedir un bloque de memoria de tamaño THREADS *BLOCKS *sizeof(curandState).Será usado para guardar el estado del generador de números aleatorios.Guardelo en devStates.gpu_monte_carlo<<<BLOCKS, THREADS>>>(dev, devStates);
    cudaMalloc((void **)&dev, BLOCKS * THREADS * sizeof(float));
    cudaMalloc((void **)&devStates, BLOCKS * THREADS * sizeof(curandState));
    // TODO: Use cudaMemcpy para copiar los datos de dev a host.
    gpu_monte_carlo<<<BLOCKS, THREADS>>>(dev, devStates);
    cudaMemcpy(host, dev, BLOCKS * THREADS * sizeof(float), cudaMemcpyDeviceToHost);
    float pi_gpu;
    for (int i = 0; i < BLOCKS * THREADS; i++)
    {
        pi_gpu += host[i];
    }
    pi_gpu /= (BLOCKS * THREADS);
    stop = clock();
    printf("GPU pi calculated in %f s.\n", (stop -
                                            start) /
                                               (float)CLOCKS_PER_SEC);
    start = clock();
    float pi_cpu = host_monte_carlo(BLOCKS * THREADS *
                                    TRIALS_PER_THREAD);
    stop = clock();
    printf("CPU pi calculated in %f s.\n", (stop -
                                            start) /
                                               (float)CLOCKS_PER_SEC);
    printf("CUDA estimate of PI = %f [error of %f]\n", pi_gpu,
           pi_gpu - PI);
    printf("CPU estimate of PI = %f [error of %f]\n", pi_cpu,
           pi_cpu - PI);
    cudaFree(dev);
    cudaFree(devStates);
    return 0;
}
