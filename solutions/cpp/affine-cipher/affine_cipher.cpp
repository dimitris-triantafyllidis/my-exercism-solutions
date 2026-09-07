#include "affine_cipher.h"

#include <numeric>
#include <stdexcept>

namespace affine_cipher {

    constexpr int m = 26;

    auto are_coprime(int a, int b) -> bool
    {
        return std::gcd(a, b) == 1;
    }

    auto modular_multiplicative_inverse(int a, int m) -> int
    {
        if (are_coprime(a, m))
        {
            for (int x = 0; x < m; x++)
            {
                if ((a * x) % m == 1)
                    return x;
            }
            throw std::invalid_argument("");
        }
        else
        {
            throw std::invalid_argument("");
        }
    }

    auto encode(unsigned char c, int a, int b) -> unsigned char
    {
        if (!are_coprime(a, m))
            throw std::invalid_argument("");

        if (std::isalpha(c) && std::islower(c))
        {
            int i = c - 'a';
            return (a * i + b) % m + 'a';
        }
        else
        {
            return c;
        }
    }

    auto decode(unsigned char c, int a, int b) -> unsigned char
    {
        if (std::isalpha(c) && std::islower(c))
        {
            int i = c - 'a';
            auto mmiam = modular_multiplicative_inverse(a, m);
            return ((((mmiam) * (i - b)) % m) + m) % m + 'a';
        }
        else
        {
            return c;
        }
    }

    auto encode(const std::string &s, int a, int b) -> std::string
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
                e.push_back(encode(std::tolower(s[i]), a, b));
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

    auto decode(const std::string &s, int a, int b) -> std::string
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
                e.push_back(decode(std::tolower(s[i]), a, b));
            }
        }

        return e;
    }

}  // namespace affine_cipher
