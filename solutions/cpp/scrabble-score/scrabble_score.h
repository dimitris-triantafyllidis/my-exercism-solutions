#pragma once

#include <string>

namespace scrabble_score {

    auto letter_points(char c) -> int;
    auto score(const std::string &s) -> int;

}  // namespace scrabble_score
