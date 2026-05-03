#include "nucleotide_count.h"

#include <stdexcept>

namespace nucleotide_count {

    auto count(const std::string &s) -> std::map<char, int>
    {
        std::map<char, int> counts = {
            {'A', 0},
            {'C', 0},
            {'G', 0},
            {'T', 0}
        };

        for (auto c : s)
        {
            if (c == 'A' || c == 'C' || c == 'G' || c == 'T' )
                counts[c]++;
            else
                throw std::invalid_argument("");
        }

        return counts;

    }

}  // namespace nucleotide_count
