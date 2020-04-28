message("External Project - Google Test")
include(FetchContent)

FetchContent_Declare(
    googletest
    GIT_REPOSITORY  https://github.com/google/googletest.git
    GIT_TAG         release-1.10.0
)

FetchContent_GetProperties(googletest)
if(NOT googletest_POPULATED)
    message(STATUS "Fetch googletest for C++ testing")
    FetchContent_Populate(googletest)
    add_subdirectory(
        ${googletest_SOURCE_DIR}
        ${googletest_SOURCE_DIR}/googlemock
    )
endif()
