add_library(exec_add_vector_static STATIC
    exec_add_vector.cu
)

set_target_properties(exec_add_vector_static PROPERTIES
    POSITION_INDEPENDENT_CODE ON
    CUDA_SEPARABLE_COMPILATION ON
)

target_compile_options(exec_add_vector_static PRIVATE
    -arch=sm_61 # GTX 1080
    -use_fast_math
    -fno-math-errno
)

target_include_directories(exec_add_vector_static PRIVATE ${PROJECT_SOURCE_DIR}/include)

target_link_libraries(exec_add_vector_static PRIVATE
    ${CUDA_LIBRARIES}
    ${CUDA_CUBLAS_LIBRARIES}
)

add_executable(exec main.cpp)
target_compile_features(exec PRIVATE cxx_std_17)

find_package(OpenMP)

target_compile_options(exec PRIVATE
    -O3
    -use_fast_math
    -fno-math-errno
    $<$<BOOL:OpenMP_CXX_FOUND>:-fopenmp>
)

target_link_libraries(exec PRIVATE
    exec_add_vector_static
    external_lib::eigen3
    $<$<BOOL:OpenMP_CXX_FOUND>:OpenMP::OpenMP_CXX>
)