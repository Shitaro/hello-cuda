add_executable(cuda_hello hello.cu)
target_compile_options(cuda_hello
    PUBLIC
    -arch=sm_50
    -use_fast_math
)

add_executable(cuda_addition_with_block addition_with_block.cu)
target_compile_options(cuda_addition_with_block
    PUBLIC
    -arch=sm_50
    -use_fast_math
)

add_executable(cuda_addition_with_thread addition_with_thread.cu)
target_compile_options(cuda_addition_with_thread
    PUBLIC
    -arch=sm_50
    -use_fast_math
)
