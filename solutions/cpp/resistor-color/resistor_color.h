#pragma once

#include <string>
#include <vector>

namespace resistor_color {

    auto color_code(const std::string &color) -> int;
    auto colors() -> std::vector<std::string>;

}  // namespace resistor_color
