#ifndef AFFINE_CIPHER_H
#define AFFINE_CIPHER_H

#include <string>

namespace affine_cipher {

    auto encode(unsigned char c, int a, int b) -> unsigned char;
    auto decode(unsigned char c, int a, int b) -> unsigned char;
    auto encode(const std::string &s, int a, int b) -> std::string;
    auto decode(const std::string &s, int a, int b) -> std::string;

}  // namespace affine_cipher

#endif  // AFFINE_CIPHER_H
