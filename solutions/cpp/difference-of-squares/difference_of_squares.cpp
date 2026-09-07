#include "difference_of_squares.h"

namespace difference_of_squares {

    auto square_of_sum(int n) -> int
    {
        int sum = 0;

        for (int i = 1; i <= n; i++)
        {
            sum += i;
        }

        return sum * sum;
    }

    auto sum_of_squares(int n) -> int
    {
        int sum = 0;

        for (int i = 1; i <= n; i++)
        {
            sum += i * i;
        }

        return sum;
    }

    auto difference(int n) -> int
    {
        return square_of_sum(n) - sum_of_squares(n);
    }

}  // namespace difference_of_squares
