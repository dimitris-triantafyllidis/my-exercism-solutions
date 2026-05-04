#include "atbash_cipher.h"
#include <cctype>

namespace atbash_cipher {

    auto encode(unsigned char c) -> unsigned char
    {
        if (std::isalpha(c) && std::islower(c))
        {
            return ('z' - c) + 'a';
        }
        else
        {
            return c;
        }
    }

    auto encode(const std::string &s) -> std::string
    {
        std::string e;

        for(std::size_t i = 0; i < s.size(); i++)
        {
            if (std::isdigit(s[i]))
            {
                e.push_back(s[i]);
            }
            else if (std::isalpha(s[i]))
            {
                e.push_back(encode(std::tolower(s[i])));
            }
            if ((e.size() == 5 || ((e.size() > 5) && ((e.size() - 5) % 6) == 0)) && e.back() != ' ')
            {
                e.push_back(' ');
            }
        }

        if (e.back() == ' ')
            return e.substr(0, e.size() - 1);
        else
            return e;
    }

    auto decode(const std::string &s) -> std::string
    {
        std::string e;

        for(std::size_t i = 0; i < s.size(); i++)
        {
            if (std::isdigit(s[i]))
            {
                e.push_back(s[i]);
            }
            else if (std::isalpha(s[i]))
            {
                e.push_back(encode(std::tolower(s[i])));
            }
        }

        return e;
    }

}  // namespace atbash_cipher
