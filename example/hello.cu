#include <stdio.h>

__global__
void cuda_hello(void) {
    printf("Hello World from GPU!\n");
}

int main(void)
{
    cuda_hello<<<1,1000>>>();
    cudaDeviceSynchronize();
    return 0;
}
