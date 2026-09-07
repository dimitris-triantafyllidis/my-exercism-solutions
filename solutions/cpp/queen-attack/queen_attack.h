#pragma once

#include <utility>

namespace queen_attack {

    class chess_board
    {

    public:

        chess_board (
            const std::pair<int, int> &white,
            const std::pair<int, int> &black
        );

        auto can_attack() const -> bool;
        auto white() const -> const std::pair<int, int>&;
        auto black() const -> const std::pair<int, int>&;

    private:

        std::pair<int, int> m_white;
        std::pair<int, int> m_black;

    };

}  // namespace queen_attack
