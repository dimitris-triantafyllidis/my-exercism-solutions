#include "crypto_square.h"
#include <cctype>

namespace crypto_square {

    cipher::cipher(const std::string &plain_text)
    {
        std::string p;

        for (std::size_t i = 0; i < plain_text.size(); i++)
            if (std::isalnum(plain_text[i]))
                p.push_back(std::tolower(plain_text[i]));

        if (p.empty())
            return;

        std::size_t c = 0;
        std::size_t r = 0;

        while (c * c < p.size())
            c++;

        if (c * c == p.size())
            r = c;
        else if (c * (c - 1) >= p.size())
            r = c - 1;
        else
            r = c;

        std::size_t p_sz_prev = p.size();
        p.resize(r * c);

        for (std::size_t i = p_sz_prev; i < p.size(); i++)
            p[i] = ' ';

        std::string ct;
        ct.resize(r * c + c - 1);
        std::fill(ct.begin(), ct.end(), ' ');

        for (std::size_t i = 0; i < r; i++)
            for (std::size_t j = 0; j < c; j++)
                ct[j * (r + 1) + i] = p[i * c + j];

        m_cipher_text = ct;
    }

    auto cipher::normalized_cipher_text() -> const std::string&
    {
        return m_cipher_text;
    }

}  // namespace crypto_square
