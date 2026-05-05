#pragma once

#include <vector>
#include <map>
#include <string>

namespace etl {

    auto transform(const std::map<int, std::vector<char>> &old) -> std::map<char, int>;

}  // namespace etl
