/* For Device Code */
#include <stdio.h>

/* For Host Code */
#include <iostream>
#include <random>

/* device function */
/* device function processed by NVIDIA compiler */
__global__ // Runs on the device, called from host code
void add(int* a, int* b, int* c) {
    /* a, b, and c must point to device memory */
    /* threadIdx.x: to access thread index */
    c[threadIdx.x] = a[threadIdx.x] + b[threadIdx.x];
}

void random_ints(int* a, int N) {
    std::mt19937 mt{ std::random_device{}() };
    std::uniform_int_distribution<int> dist(0, 255);
    for (int i = 0; i < N; i++) {
        a[i] = dist(mt);
    }
}

/* host function */
int main(void) {
    static constexpr int N = 512;
    int *a, *b, *c;    // host copies of a, b, c
    int *d_a, *d_b, *d_c;   // device copies of a, b, c
    int size = N * sizeof(int);

    /* allocate space for device copies of a, b, c */
    cudaMalloc((void**)&d_a, size);
    cudaMalloc((void**)&d_b, size);
    cudaMalloc((void**)&d_c, size);

    /* allocate space for host copies of a, b, c */
    a = (int*)malloc(size);
    b = (int*)malloc(size);
    c = (int*)malloc(size);

    /* setup input values */
    random_ints(a, N);
    random_ints(b, N);

    /* copy inputs to device */
    cudaMemcpy(d_a, a, size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, size, cudaMemcpyHostToDevice);

    /* launch add() kernel on GPU with N threads */
    /* thread: block can be split into parallel threads */
    add<<<1,N>>>(d_a, d_b, d_c); // kernel launch: triple angle bracets mark a call from host code to device code

    /* copy result back to host */
    cudaMemcpy(c, d_c, size, cudaMemcpyDeviceToHost);

    for (int i = 0; i < N; i++) {
        std::cout << a[i] << "+" << b[i] << "=" << c[i] << std::endl;
    }

    /* cleanup */
    free(a);
    free(b);
    free(c);

    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);

    return 0;
}
