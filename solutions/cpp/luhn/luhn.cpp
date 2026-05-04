#include "luhn.h"

#include <cctype>
#include <vector>

namespace luhn {

    auto valid(const std::string &s) -> bool
    {
        std::vector<int> digits;

        for (const auto &c : s)
            if (std::isdigit(c))
                digits.push_back(c - '0');
            else if (c == ' ')
                continue;
            else
                return false;

        if (digits.size() < 2) return false;

        for (int i = static_cast<int>(digits.size()) - 2; i >= 0; i -= 2)
            digits[i] = (2 * digits[i]) > 9 ?
                            (2 * digits[i]) - 9 :
                            (2 * digits[i]);

        int sum = 0;

        for (auto d : digits)
            sum += d;

        return sum % 10 == 0;
    }

}  // namespace luhn
