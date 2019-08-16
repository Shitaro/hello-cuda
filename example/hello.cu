#include <iostream>
#include <stdio.h>

/* device function */
/* device function processed by NVIDIA compiler */
__global__ // Runs on the device, called from host code
void cuda_hello(void) {
    printf("Hello World from GPU!\n");
}

int main(void)
{
    std::cout << "Hello World from Host" << std::endl;

    cuda_hello<<<1,1000>>>(); // kernel launch: triple angle bracets mark a call from host code to device code

    cudaDeviceSynchronize();
    return 0;
}
