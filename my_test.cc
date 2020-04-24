#include <iostream>

int f(int x) {
    if (x > 10)
        return 11;
    else 
        return 12;
}

int main() {
    std::cout << f(123) << '\n';
}
