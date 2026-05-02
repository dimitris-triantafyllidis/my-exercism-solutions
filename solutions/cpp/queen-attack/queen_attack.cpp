#include "queen_attack.h"

#include <stdexcept>

namespace queen_attack {

    chess_board::chess_board (
        const std::pair<int, int> &white,
        const std::pair<int, int> &black
    )
    {
        if (
            white == black ||
            white.first < 0 ||
            white.second < 0 ||
            black.first < 0 ||
            black.second < 0 ||
            white.first > 7 ||
            white.second > 7 ||
            black.first > 7 ||
            black.second > 7
        )
        {
            throw std::domain_error("");
        }

        m_white = white;
        m_black = black;
    }

    auto chess_board::can_attack() const -> bool
    {
        return
            m_white.first == m_black.first ||
            m_white.second == m_black.second ||
            std::abs(m_white.first - m_black.first) == std::abs(m_white.second - m_black.second);
    }

    auto chess_board::white() const -> const std::pair<int, int>&
    {
        return m_white;
    }

    auto chess_board::black() const -> const std::pair<int, int>&
    {
        return m_black;
    }

}  // namespace queen_attack
