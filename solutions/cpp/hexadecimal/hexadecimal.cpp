#include "hexadecimal.h"

#include <cmath>

namespace hexadecimal {

    auto convert(const std::string &s) -> int
    {
        int n = 0;

        for (int i = 0; i < int(s.length()); i++)
        {
            int idx = s.length() - 1 - i;

            if (s[idx] == '0')
                continue;
            else if (s[idx] == '1')
                n += std::pow(16, i);
            else if (s[idx] == '2')
                n += 2 * std::pow(16, i);
            else if (s[idx] == '3')
                n += 3 * std::pow(16, i);
            else if (s[idx] == '4')
                n += 4 * std::pow(16, i);
            else if (s[idx] == '5')
                n += 5 * std::pow(16, i);
            else if (s[idx] == '6')
                n += 6 * std::pow(16, i);
            else if (s[idx] == '7')
                n += 7 * std::pow(16, i);
            else if (s[idx] == '8')
                n += 8 * std::pow(16, i);
            else if (s[idx] == '9')
                n += 9 * std::pow(16, i);
            else if (s[idx] == 'a')
                n += 10 * std::pow(16, i);
            else if (s[idx] == 'b')
                n += 11 * std::pow(16, i);
            else if (s[idx] == 'c')
                n += 12 * std::pow(16, i);
            else if (s[idx] == 'd')
                n += 13 * std::pow(16, i);
            else if (s[idx] == 'e')
                n += 14 * std::pow(16, i);
            else if (s[idx] == 'f')
                n += 15 * std::pow(16, i);
            else
                return 0;
        }

        return n;

    }

}  // namespace hexadecimal
