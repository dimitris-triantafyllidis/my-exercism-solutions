#include "etl.h"

namespace etl {

    auto transform(const std::map<int, std::vector<char>> &old) -> std::map<char, int>
    {
        std::map<char, int> m;

        for (const auto &kv : old) {
            const auto &points = kv.first;
            const auto &letters = kv.second;
            for (const auto &letter : letters)
            {
                m[std::tolower(letter)] = points;
            }
        }

        return m;
    }
}  // namespace etl
