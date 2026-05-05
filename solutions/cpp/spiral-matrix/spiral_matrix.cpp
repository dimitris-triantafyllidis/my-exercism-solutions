#include "spiral_matrix.h"

namespace spiral_matrix {

    auto spiral_matrix(uint32_t n) -> std::vector<std::vector<uint32_t>>
    {

        auto m = std::vector<std::vector<uint32_t>>();
        m.resize(n);
        for(std::size_t i = 0; i < m.size(); i++)
            m[i].resize(n);

        int32_t run_count  = 0;
        int32_t run_length = n;
        int32_t direction  = 0;

        int32_t step = 1;
        int32_t run_step = 1;

        int32_t cursor_row    = 1;
        int32_t cursor_column = 1;

        while (step <= int32_t(n * n))
        {
            if (run_step == run_length)
            {
                run_step = 1;
                run_count += 1;
            }

            m[cursor_row - 1][cursor_column - 1] = step;

            direction = run_count % 4;

            run_length = n - (run_count - 1) / 2;

            if (direction == 0)
                cursor_column += 1;
            else if (direction == 1)
                cursor_row += 1;
            else if (direction == 2)
                cursor_column -= 1;
            else if (direction == 3)
                cursor_row -= 1;

            step += 1;
            run_step += 1;
        }

        return m;

    }

}  // namespace spiral_matrix
