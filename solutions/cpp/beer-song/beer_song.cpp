#include "beer_song.h"
#include <string>

namespace beer_song {

    auto verse(int n) -> std::string
    {
        if (n == 0)
            return
                std::string("No more bottles of beer on the wall, no more bottles of beer.\n") +
                std::string("Go to the store and buy some more, 99 bottles of beer on the wall.\n");
        else
            return
                std::to_string(n) +
                (
                    (n > 1) ?
                        std::string(" bottles of beer on the wall, ") + std::to_string(n) + std::string(" bottles of beer.\n") :
                        std::string(" bottle of beer on the wall, ") + std::to_string(n) + std::string(" bottle of beer.\n")
                ) +
                std::string("Take ") + (n == 1 ? "it" : "one") +
                std::string(" down and pass it around, ") +
                (
                    (n - 1) > 1 ?
                        std::to_string(n - 1) + std::string(" bottles of beer on the wall.\n") :
                        (n - 1) > 0 ?
                            std::to_string(n - 1) + std::string(" bottle of beer on the wall.\n") :
                            std::string("no more bottles of beer on the wall.\n")
                );
    }

    auto sing(int f, int t) -> std::string
    {
        std::string verses;

        for (int i = f; i >= t; i--)
        {
            verses = verses + verse(i);
            if (i != t) verses = verses + "\n";
        }

        return verses;
    }

}  // namespace beer_song
