#include "sieve.h"

#include <vector>

namespace sieve {

    auto primes(int n) -> std::vector<int>
    {
        std::vector<int> sieve(n + 1);

        for (std::size_t i = 0; i < sieve.size(); i++)
        {
            sieve[i] = i;
        }

        sieve[1] = 0;

        for (std::size_t i = 2; i < sieve.size(); i++)
        {
            if (sieve[i] == 0)
            {
                continue;
            }
            else
            {
                for (std::size_t m = 2 * i; m < sieve.size(); m += i)
                {
                    sieve[m] = 0;
                }
            }
        }

        std::vector<int> ps;

        for (std::size_t i = 0; i < sieve.size(); i++)
        {
            if (sieve[i] == 0)
            {
                continue;
            }
            else
            {
                ps.push_back(sieve[i]);
            }
        }

        return ps;
    }

}  // namespace sieve
