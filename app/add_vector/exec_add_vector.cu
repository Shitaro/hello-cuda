#include "exec_add_vector.h"

#include <iostream>
#include <cstdint>
#include <random>

#include <mycuda/add_vector.cu>
#include <cuda.h>
#include <cuda_runtime_api.h>

template <typename T>
void random_float(T* a, std::int32_t N) {
    std::mt19937 mt(std::random_device{}());
    std::uniform_real_distribution<float> dist;

    for (std::int32_t idx = 0; idx < N; idx++) {
        a[idx] = dist(mt);
    }
}

template <typename T>
void exec_add_vector(std::int32_t N) {
    T *host_a, *host_b, *host_c;
    T *dev_a, *dev_b, *dev_c;
    std::int32_t size = N * sizeof(T);

    cudaMallocHost((void**)&host_a, size);
    cudaMallocHost((void**)&host_b, size);
    cudaMallocHost((void**)&host_c, size);

    random_float(host_a, N);
    random_float(host_b, N);

    cudaMalloc((void**)&dev_a, size);
    cudaMalloc((void**)&dev_b, size);
    cudaMalloc((void**)&dev_c, size);

    cudaMemcpy(dev_a, host_a, size, cudaMemcpyHostToDevice);
    cudaMemcpy(dev_b, host_b, size, cudaMemcpyHostToDevice);

    mycuda::add_vector<<<1, N>>>(dev_a, dev_b, dev_c);

    cudaMemcpy(host_c, dev_c, size, cudaMemcpyDeviceToHost);

    std::cout << "host_a[" << N - 1 << "]: " << host_a[N - 1] << ", "
              << "host_b[" << N - 1 << "]: " << host_b[N - 1] << ", "
              << "host_c[" << N - 1 << "]: " << host_c[N - 1] << std::endl;

    std::cout << host_a[N - 1] << " + " << host_b[N - 1] << " = " << host_c[N - 1] << std::endl;

    cudaFreeHost(host_a);
    cudaFreeHost(host_b);
    cudaFreeHost(host_c);

    cudaFree(dev_a);
    cudaFree(dev_b);
    cudaFree(dev_c);
}

template void exec_add_vector<float>(std::int32_t N);
template void exec_add_vector<double>(std::int32_t N);