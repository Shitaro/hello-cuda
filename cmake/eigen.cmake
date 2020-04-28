message("External project - Eigen")
include(FetchContent)

FetchContent_Declare(
    eigen3
    GIT_REPOSITORY https://gitlab.com/libeigen/eigen
    GIT_TAG        3.3.7
)

FetchContent_GetProperties(eigen3)
if(NOT eigen_POPULATED)
    message(STATUS "Fetch eigen3")
    FetchContent_Populate(eigen3)
    message("source directory:" ${eigen3_SOURCE_DIR})
    add_subdirectory(${eigen3_SOURCE_DIR})
endif()

add_library(eigen3_library INTERFACE)
add_library(external_lib::eigen3 ALIAS eigen3_library)
target_include_directories(eigen3_library INTERFACE ${eigen3_SOURCE_DIR})