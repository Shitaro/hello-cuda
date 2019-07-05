# add_executable(exec main.cpp)
add_executable(cuda_hello hello.cu)

# target_compile_options(exec
#     PUBLIC
#     -Wall
# )

target_compile_options(cuda_hello
    PUBLIC
    -arch=sm_50
    -use_fast_math
)

# target_link_libraries(exec
#     linalg
# )
