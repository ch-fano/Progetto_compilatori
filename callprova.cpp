#include <iostream>

extern "C" {
    double fun();
}

int main() {
    std::cout<<fun()<<std::endl;
    return 0;
}