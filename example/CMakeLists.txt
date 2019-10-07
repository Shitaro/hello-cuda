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
set_property(TARGET cuda_addition_with_block
    PROPERTY CUDA_SEPARABLE_COMPILATION ON
)
target_link_libraries(cuda_addition_with_block PRIVATE
    mycuda
)

add_executable(cuda_addition_with_thread addition_with_thread.cu)
target_compile_options(cuda_addition_with_thread
    PUBLIC
    -arch=sm_50
    -use_fast_math
)
set_property(TARGET cuda_addition_with_thread
    PROPERTY CUDA_SEPARABLE_COMPILATION ON
)
target_link_libraries(cuda_addition_with_thread PRIVATE
    mycuda
)

add_executable(cuda_addition addition.cu)
target_compile_options(cuda_addition
    PUBLIC
    -arch=sm_50
    -use_fast_math
)
set_property(TARGET cuda_addition
    PROPERTY CUDA_SEPARABLE_COMPILATION ON
)

target_link_libraries(cuda_addition PRIVATE
    mycuda
)
