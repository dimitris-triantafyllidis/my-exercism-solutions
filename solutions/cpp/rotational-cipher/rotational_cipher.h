#pragma once

#include <string>

namespace rotational_cipher {

    auto rotate(unsigned char c, int n) -> unsigned char;
    auto rotate(const std::string &s, int n) -> std::string;

}  // namespace rotational_cipher
