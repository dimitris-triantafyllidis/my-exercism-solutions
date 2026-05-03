#include "series.h"

#include <stdexcept>

namespace series {

    auto slice(const std::string &s, int l) -> std::vector<std::string>
    {
        if (l < 1 || l > static_cast<int>(s.length()))
            throw std::domain_error("");

        std::vector<std::string> slices;

        for (std::size_t i = 0; i <= s.length() - l; i++)
        {
            slices.push_back(s.substr(i, l));
        }

        return slices;
    }

}  // namespace series
