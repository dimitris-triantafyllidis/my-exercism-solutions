#include "rotational_cipher.h"

#include <cctype>
#include <algorithm>
#include <iterator>

namespace rotational_cipher {

    auto rotate(unsigned char c, int n) -> unsigned char
    {
        if (!std::isalpha(c))
        {
            return c;
        }
        else if (std::isupper(c))
        {
            return ((c - 'A') + (n % 26)) % 26 + 'A';
        }
        else
        {
            return ((c - 'a') + (n % 26)) % 26 + 'a';
        }
    }

    auto rotate(const std::string &s, int n) -> std::string
    {
        std::string e;

        std::transform (
            s.begin(),
            s.end(),
            std::back_inserter(e),
            [=] (unsigned char c)
            {
                return rotate(c, n);
            }
        );

        return e;
    }

}  // namespace rotational_cipher
