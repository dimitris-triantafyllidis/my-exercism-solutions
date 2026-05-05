#include "eliuds_eggs.h"

namespace chicken_coop {

    auto positions_to_quantity(uint64_t p) -> int
    {
        int count = 0;

        for (int i = 0; i < 63; i++)
            if ((p >> i) & 1)
                count++;

        return count;
    }

}  // namespace chicken_coop
