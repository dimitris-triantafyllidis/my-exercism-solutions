#include "sum_of_multiples.h"

#include <numeric>
#include <set>

namespace sum_of_multiples {

    auto to(const std::vector<int> &numbers, int limit) -> int
    {
        std::set<int> unique_multiples;

        for (const auto &n : numbers)
        {
            auto m = n;
            while (m < limit)
            {
                unique_multiples.insert(m);
                m += n;
            }
        }

        return std::accumulate(unique_multiples.begin(), unique_multiples.end(), 0);
    }

}  // namespace sum_of_multiples
