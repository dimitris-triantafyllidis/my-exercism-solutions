#include "collatz_conjecture.h"

#include <stdexcept>

namespace collatz_conjecture {

    auto steps(int n) -> int
    {
        if (n <= 0)
            throw std::domain_error("");

        int steps = 0;

        while (n != 1)
        {
            if (n % 2)
                n = 3 * n + 1;
            else
                n /= 2;

            steps++;
        }

        return steps;
    }

}  // namespace collatz_conjecture
