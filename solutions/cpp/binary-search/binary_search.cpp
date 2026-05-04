#include "binary_search.h"

#include <stdexcept>

namespace binary_search {

    auto find(const std::vector<int> &data, int x) -> std::size_t
    {
        if (data.empty())
        {
            throw std::domain_error("");
        }

        std::size_t min_idx = 0;
        std::size_t max_idx = data.size() - 1;

        if (data[min_idx] == x)
            return min_idx;
        else if (data[max_idx] == x)
            return max_idx;

        while (true)
        {
            if (max_idx - min_idx == 1)
            {
                throw std::domain_error("");
            }
            else
            {
                std::size_t candidate_idx = (min_idx + max_idx) / 2;
                if (data[candidate_idx] == x)
                    return candidate_idx;
                else if (data[candidate_idx] < x)
                    min_idx = candidate_idx;
                else if (data[candidate_idx] > x)
                    max_idx = candidate_idx;
            }
        }
    }

}  // namespace binary_search
