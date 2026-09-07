#include "nth_prime.h"

#include <stdexcept>
#include <limits>
#include <cmath>

namespace nth_prime {

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

    auto nth(long long n) -> long long
    {
        if (n < 1)
            throw std::domain_error("");

        long long p = 2;

        while (n > 1)
        {
            p = next_prime(p);
            n--;
        }

        return p;
    }

}  // namespace nth_prime
