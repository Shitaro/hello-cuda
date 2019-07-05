add_executable(exec_gtest
    main.cpp
    test.cpp
)

target_compile_options(exec_gtest
    PRIVATE
    -fconstexpr-loop-limit=10000
    -fdump-tree-original-raw
)

target_link_libraries(exec_gtest
    # linalg
    gtest
    gmock
    gtest_main
)

add_test(exec_gtest exec_gtest)
