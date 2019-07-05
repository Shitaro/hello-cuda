cmake_minimum_required(VERSION 3.11)

set(CMAKE_CXX_STANDARD 17)

project(constexpr_linalg)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/external)

enable_testing()
include(googletest)

include(CheckLanguage)
check_language(CUDA)
if(CMAKE_CUDA_COMPILER)
    enable_language(CUDA)
else()
    message(STATUS "No CUDA support")
endif()

add_subdirectory(include)
add_subdirectory(example)
add_subdirectory(test)
