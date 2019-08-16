add_executable(cuda_hello hello.cu)
target_compile_options(cuda_hello
    PUBLIC
    -arch=sm_50
    -use_fast_math
)

add_executable(cuda_addition addition.cu)
target_compile_options(cuda_addition
    PUBLIC
    -arch=sm_50
    -use_fast_math
)
