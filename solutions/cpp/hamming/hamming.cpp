#include "hamming.h"

#include <stdexcept>

namespace hamming {

    auto compute(const std::string &s1, const std::string &s2) -> int
    {
        int h = 0;

        if (s1.size() != s2.size())
            throw std::domain_error("");

        for (int i = 0; i < s1.size(); i++)
            if (s1[i] != s2[i]) h++;

        return h;
    }

}  // namespace hamming
