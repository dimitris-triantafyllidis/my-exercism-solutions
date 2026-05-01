#include "grains.h"

#include <cstdint>
#include <cmath>

namespace grains {

    auto square(uint64_t n) -> uint64_t
    {
        return std::pow(2, n - 1);
    }

    auto total() -> uint64_t
    {
        uint64_t t = 0;

        for(int i = 1; i <= 64; i++)
            t += square(i);

        return t;
    }

}  // namespace grains
