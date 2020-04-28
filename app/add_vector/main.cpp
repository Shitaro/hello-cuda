#include <iostream>
#include "exec_add_vector.h"

int main() {
    std::cout << "Hello, world!";

    exec_add_vector<float>(100000000);
    exec_add_vector<double>(100000000);

    return 0;
}