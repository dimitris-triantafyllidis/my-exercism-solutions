#pragma once

#include <string>

namespace atbash_cipher {

    auto encode(unsigned char c) -> unsigned char;
    auto encode(const std::string &s) -> std::string;
    auto decode(const std::string &s) -> std::string;

}  // namespace atbash_cipher
