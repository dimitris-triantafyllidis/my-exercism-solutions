#include "perfect_numbers.h"

#include <stdexcept>

namespace perfect_numbers {

    auto aliquot_sum(int n) -> int
    {
        if (n < 1)
            throw std::domain_error("");

        int sum = 0;

        for (int i = 1; i <= n-1; i++)
            sum += n % i == 0 ? i : 0;

        return sum;
    }

    auto classify(int n) -> classification
    {
        if (n == aliquot_sum(n))
            return classification::perfect;
        else if (n < aliquot_sum(n))
            return classification::abundant;
        else
            return classification::deficient;
    }

}  // namespace perfect_numbers
