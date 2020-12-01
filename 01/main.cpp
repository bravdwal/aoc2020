#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>

#define VALUE 2020

std::vector<int> read_input(const std::string& path) {
    std::ifstream file(path);
    int i;
    std::vector<int> ret;
    while (file >> i) {
        ret.push_back(i);
    }
    return ret;
}

int main(void) {
    std::vector<int> input = read_input("input.txt");
    
    // Brute forcing excersise 1
    for (int i = 0; i < input.size(); i++) {
        for (int j = i + 1; j < input.size(); j++) {
            if (input[i] + input[j] == VALUE) {
                std::cout << input[i] << " * " << input[j] << " = " << (input[i] * input[j]) << std::endl;
            }
        }
    }

    // Brute forcing excersise 2    
    for (int i = 0; i < input.size(); i++) {
        for (int j = i + 1; j < input.size(); j++) {
            for (int k = j + 1; k < input.size(); k++) {
                if (input[i] + input[j] + input[k] == VALUE) {
                    std::cout << input[i] << " * " << input[j] << " * " << input[k] << " = " << (input[i] * input[j] * input[k]) << std::endl;
                }
            }
        }
    }

    return 0;
}
