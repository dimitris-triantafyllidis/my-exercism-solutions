#include "trinary.h"

#include <cmath>

namespace trinary {

    auto to_decimal(const std::string &s) -> int
    {
        int n = 0;

        for (int i = 0; i < int(s.length()); i++)
        {
            int idx = s.length() - 1 - i;

            if (s[idx] == '0')
                continue;
            else if (s[idx] == '1')
                n += std::pow(3, i);
            else if (s[idx] == '2')
                n += 2 * std::pow(3, i);
            else
                return 0;
        }

        return n;

    }

}  // namespace trinary
