#include "binary.h"

#include <cmath>

namespace binary {

    auto convert(const std::string &s) -> int
    {
        int n = 0;

        for (int i = 0; i < int(s.length()); i++)
        {
            int idx = s.length() - 1 - i;

            if (s[idx] == '0')
                continue;
            else if (s[idx] == '1')
                n += std::pow(2, i);
            else
                return 0;
        }

        return n;

    }

}  // namespace binary
