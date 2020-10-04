#include <iostream>
#include <random>
#include <climits>
#include <fstream>

int Rnd(std::mt19937 &gen) {
    std::uniform_int_distribution<int> dist(0, 2);
    return dist(gen);
}

int RandNeg(std::mt19937 &gen) {
    std::uniform_int_distribution<int> dist(INT_MIN, -1);
    return dist(gen);
}

int RandPos(std::mt19937 &gen) {
    std::uniform_int_distribution<int> dist(1, INT_MAX);
    return dist(gen);
}

int main() {
    std::mt19937 gen(6274674);
    std::ofstream out("/Users/nikitaigumnov/Documents/GitHub/HSE-FCS-SE-NASM/HW2/tests/test_7.txt");
    int n = 100;
    out << n << '\n';
    for (int i = 0; i < 100; ++i) {
        int x = Rnd(gen);
        if (x == 0) {
            out << RandNeg(gen) << ' ';
        } else if (x == 1) {
            out << 0 << ' ';
        } else {
            out << RandPos(gen) << ' ';
        }
    }
    return 0;
}
