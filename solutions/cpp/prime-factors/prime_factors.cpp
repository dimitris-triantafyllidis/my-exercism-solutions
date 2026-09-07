#include "prime_factors.h"

#include <cmath>
#include <limits>
#include <stdexcept>

namespace prime_factors {

    auto is_prime(long long n) -> bool
    {
        if (n == 0 || n == 1)
            return false;

        for (int m = 2; m <= std::ceil(std::sqrt(n)); m++)
            if (n != m && n % m == 0)
                return false;

        return true;
    }

    auto next_prime(long long n) -> long long
    {
        for (long long m = n + 1; m <= std::numeric_limits<long long>::max(); m++)
            if (is_prime(m))
                return m;

        throw std::domain_error("");
    }

    auto of(long long n) -> std::vector<long long>
    {
        std::vector<long long> prime_factors;

        long long current_test_factor = 2;

        while (n != 1)
        {
            if (n % current_test_factor == 0)
            {
                n /= current_test_factor;
                prime_factors.push_back(current_test_factor);
            }
            else
            {
                current_test_factor = next_prime(current_test_factor);
            }
        }

        return prime_factors;
    }

}  // namespace prime_factors
