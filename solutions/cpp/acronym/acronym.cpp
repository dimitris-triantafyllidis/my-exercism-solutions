#include "acronym.h"

#include <cctype>
#include <iterator>
#include <algorithm>

namespace acronym {

    auto acronym(const std::string &s) -> std::string
    {
        std::string sc;
        sc.reserve(s.size());

        std::copy_if (
            s.begin(),
            s.end(),
            std::back_inserter(sc),
            [] (unsigned char c) {
                return
                    std::isalpha(c) ||
                    c == ' ' ||
                    c == '-';
            }
        );

        std::string a;
        a.reserve(sc.size());

        for (std::size_t i = 0; i < sc.size(); i++)
        {
            if (i == 0 &&  std::isalpha(sc[i]))
            {
                a.push_back(std::toupper(sc[i]));
            }
            else if ((sc[i-1] == ' ' || sc[i-1] == '-') && std::isalpha(sc[i]))
            {
                a.push_back(std::toupper(sc[i]));
            }
        }

        return a;
    }

}  // namespace acronym
