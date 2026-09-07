#include "pangram.h"

#include <set>

namespace pangram {

    auto is_pangram(std::string s) -> bool
    {
        std::set<char> letters;

        for (unsigned char c : s)
        {
            if (std::isalpha(c))
            {
                letters.insert(std::tolower(c));
            }
        }

        return letters.size() == 26;
    }

}  // namespace pangram
