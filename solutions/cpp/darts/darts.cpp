#include "darts.h"

namespace darts {

    auto score(double x, double y) -> int
    {
        double r = sqrt(x*x + y*y);

        if (r > 10)
            return 0;
        else if (r > 5)
            return 1;
        else if (r > 1)
            return 5;
        else
            return 10;
    }

}  // namespace darts
