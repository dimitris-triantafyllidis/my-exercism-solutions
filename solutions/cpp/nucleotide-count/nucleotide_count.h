#pragma once

#include <map>
#include <string>

namespace nucleotide_count {

    auto count(const std::string &s) -> std::map<char, int>;

}  // namespace nucleotide_count
