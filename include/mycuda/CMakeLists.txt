add_library(mycuda STATIC)

target_compile_features(mycuda PUBLIC cxx_std_11)

set_target_properties(mycuda PROPERTIES
                             CUDA_SEPARABLE_COMPILATION ON
)

target_include_directories(mycuda PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/..
)

add_subdirectory(add_vector)
