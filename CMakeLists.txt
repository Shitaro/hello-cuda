cmake_minimum_required(VERSION 3.11...3.15)

set(CMAKE_CXX_STANDARD 17)

project(hello_cuda
    LANGUAGES CXX
)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

include(googletest)
include(cuda)
include(eigen)

add_subdirectory(app)
add_subdirectory(test)