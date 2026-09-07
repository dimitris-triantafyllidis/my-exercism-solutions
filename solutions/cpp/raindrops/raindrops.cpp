#include "raindrops.h"

namespace raindrops {

    auto convert(int n) -> std::string
    {
        std::string s = "";

        if (n % 3 == 0)
            s += "Pling";

        if (n % 5 == 0)
            s += "Plang";

        if (n % 7 == 0)
            s += "Plong";

        if (s == "")
            s = std::to_string(n);

        return s;
    }

}  // namespace raindrops
