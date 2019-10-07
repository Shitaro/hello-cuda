#ifndef MYCUDA_ADD_VECTOR_CU
#define MYCUDA_ADD_VECTOR_CU

namespace mycuda {
    /* device function */
    /* device function processed by NVIDIA compiler */
    template<typename T>
    __global__ // Runs on the device, called from host code
    void add_vector(T* a, T* b, T* c) {
        /* a, b, and c must point to device memory */
        const int index = threadIdx.x + blockIdx.x * blockDim.x;
        c[index] = a[index] + b[index];
    }
} // namespace mycuda

#endif
