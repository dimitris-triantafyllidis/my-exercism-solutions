#pragma once

#include <string>

namespace crypto_square {

    struct cipher
    {
        cipher(const std::string &plain_text);
        auto normalized_cipher_text() -> const std::string&;
        std::string m_cipher_text = "";
    };

}  // namespace crypto_square
