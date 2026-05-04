#include "isogram.h"
#include <algorithm>

#include <cctype>
#include <iterator>
#include <set>

namespace isogram {

    auto normalize(const std::string &s) -> std::string
    {
        std::string n;
        n.reserve(s.size());

        std::copy_if (
            s.begin(),
            s.end(),
            std::back_inserter(n),
            [] (unsigned char c) { return std::isalpha(c); }
        );

        std::transform (
            n.begin(),
            n.end(),
            n.begin(),
            [] (unsigned char c) { return std::tolower(c); }
        );

        return n;
    }

    auto is_isogram(const std::string &s) -> bool
    {
        std::set<unsigned char> contained_letters;

        auto n = normalize(s);

        for (auto c : n)
        {
            contained_letters.insert(c);
        }

        return n.length() == contained_letters.size();
    }

}  // namespace isogram
