#include "isbn_verifier.h"
#include <cctype>
#include <vector>


namespace isbn_verifier {

    auto is_valid(const std::string &s) -> bool
    {
        std::string rh;

        if (s.size() == 13 && s[1] == s[5] && s[5] == s[11] && s[11] == '-')
            rh = s.substr(0, 1) + s.substr(2, 3) + s.substr(6, 5) + s.substr(12, 1);
        else if (s.size() == 10)
            rh = s;
        else
            return false;

        std::vector<int> d;

        for (std::size_t i = 0; i < rh.size(); i++)
        {
            if (std::isdigit(rh[i]))
                d.push_back(rh[i] - '0');
            else if (i == 9 && rh[i] == 'X')
                d.push_back(10);
            else
                return false;
        }

        bool is_valid = (d[0] * 10 + d[1] * 9 + d[2] * 8 + d[3] * 7 + d[4] * 6 + d[5] * 5 + d[6] * 4 + d[7] * 3 + d[8] * 2 + d[9] * 1) % 11 == 0;

        return is_valid;
    }

}  // namespace isbn_verifier
