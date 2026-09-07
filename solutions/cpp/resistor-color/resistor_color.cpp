#include "resistor_color.h"

#include <map>

namespace resistor_color {

    const std::map<std::string, int> color_values {
        {"black", 0},
        {"brown", 1},
        {"red", 2},
        {"orange", 3},
        {"yellow", 4},
        {"green", 5},
        {"blue", 6},
        {"violet", 7},
        {"grey", 8},
        {"white", 9}
    };

    auto color_code(const std::string &color) -> int
    {
        return color_values.at(color);
    }

    auto colors() -> std::vector<std::string>
    {
        return {
            "black",
            "brown",
            "red",
            "orange",
            "yellow",
            "green",
            "blue",
            "violet",
            "grey",
            "white"
        };
    }

}  // namespace resistor_color
