#include "scrabble_score.h"

namespace scrabble_score {

    int letter_points(char c)
    {
        c = static_cast<char>(std::toupper(static_cast<unsigned char>(c)));

        switch (c) {
            case 'A': case 'E': case 'I': case 'O': case 'U':
            case 'L': case 'N': case 'R': case 'S': case 'T':
                return 1;

            case 'D': case 'G':
                return 2;

            case 'B': case 'C': case 'M': case 'P':
                return 3;

            case 'F': case 'H': case 'V': case 'W': case 'Y':
                return 4;

            case 'K':
                return 5;

            case 'J': case 'X':
                return 8;

            case 'Q': case 'Z':
                return 10;

            default:
                return 0;
        }
    }

    int score(const std::string& s)
    {
        int total = 0;
        for (char c : s)
            total += letter_points(c);
        return total;
    }

}  // namespace scrabble_score
