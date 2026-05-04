#include "anagram.h"

#include <algorithm>
#include <vector>

// return filter(candidate -> (lowercase(subject) != lowercase(candidate)) && (sort(collect(lowercase(candidate))) == sort(collect(lowercase(subject)))), candidates)

namespace anagram {

    auto anagram::to_lower(const std::string &s) -> std::string
    {
        auto l = s;

        std::transform (
            l.begin(),
            l.end(),
            l.begin(),
            [] (unsigned char c) { return std::tolower(c); }
        );

        return l;
    }

    auto anagram::normalize(const std::string &s) -> std::string
    {
        auto n = to_lower(s);

        std::sort (
            n.begin(),
            n.end()
        );

        return n;
    }

    anagram::anagram(const std::string &subject) : m_subject(subject)
    {}

    auto anagram::matches(const std::vector<std::string> &candidates) -> std::vector<std::string>
    {
        std::vector<std::string> ms;

        for (const auto &candidate : candidates)
        {
            if (
                normalize(m_subject) == normalize(candidate) &&
                !(to_lower(m_subject) == to_lower(candidate))
            )
            {
                ms.push_back(candidate);
            }
        }

        return ms;
    }

}  // namespace anagram
