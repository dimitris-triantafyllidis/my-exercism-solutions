#include "armstrong_numbers.h"

#include <string>
#include <cmath>

namespace armstrong_numbers {

    auto is_armstrong_number(int n) -> bool
    {

        auto digits = std::to_string(n);

        int sum = 0;

        for (auto c : digits)
        {
            sum += std::pow(c - '0', digits.size());
        }

        return sum == n;

    }

}  // namespace armstrong_numbers
