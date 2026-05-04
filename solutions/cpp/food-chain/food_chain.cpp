#include "food_chain.h"

#include <string>
#include <stdexcept>

namespace food_chain {

    auto verse(int v) -> std::string
    {

        if (v == 1)
            return
                std::string("I know an old lady who swallowed a fly.\n") +
                std::string("I don't know why she swallowed the fly. Perhaps she'll die.\n");
        else if (v == 2)
            return
                std::string("I know an old lady who swallowed a spider.\n") +
                std::string("It wriggled and jiggled and tickled inside her.\n") +
                std::string("She swallowed the spider to catch the fly.\n") +
                std::string("I don't know why she swallowed the fly. Perhaps she'll die.\n");
        else if (v == 3)
            return
                std::string("I know an old lady who swallowed a bird.\n") +
                std::string("How absurd to swallow a bird!\n") +
                std::string("She swallowed the bird to catch the spider that wriggled and jiggled ") +
                std::string("and tickled inside her.\n") +
                std::string("She swallowed the spider to catch the fly.\n") +
                std::string("I don't know why she swallowed the fly. Perhaps she'll die.\n");
        else if (v == 4)
            return
                std::string("I know an old lady who swallowed a cat.\n") +
                std::string("Imagine that, to swallow a cat!\n") +
                std::string("She swallowed the cat to catch the bird.\n") +
                std::string("She swallowed the bird to catch the spider that wriggled and jiggled ") +
                std::string("and tickled inside her.\n") +
                std::string("She swallowed the spider to catch the fly.\n") +
                std::string("I don't know why she swallowed the fly. ") +
                std::string("Perhaps she'll die.\n");
        else if (v == 5)
            return
                std::string("I know an old lady who swallowed a dog.\n") +
                std::string("What a hog, to swallow a dog!\n") +
                std::string("She swallowed the dog to catch the cat.\n") +
                std::string("She swallowed the cat to catch the bird.\n") +
                std::string("She swallowed the bird to catch the spider that wriggled and jiggled ") +
                std::string("and tickled inside her.\n") +
                std::string("She swallowed the spider to catch the fly.\n") +
                std::string("I don't know why she swallowed the fly. ") +
                std::string("Perhaps she'll die.\n");
        else if (v == 6)
            return
                std::string("I know an old lady who swallowed a goat.\n") +
                std::string("Just opened her throat and swallowed a goat!\n") +
                std::string("She swallowed the goat to catch the dog.\n") +
                std::string("She swallowed the dog to catch the cat.\n") +
                std::string("She swallowed the cat to catch the bird.\n") +
                std::string("She swallowed the bird to catch the spider that wriggled and jiggled ") +
                std::string("and tickled inside her.\n") +
                std::string("She swallowed the spider to catch the fly.\n") +
                std::string("I don't know why she swallowed the fly. ") +
                std::string("Perhaps she'll die.\n");
        else if (v == 7)
            return
                std::string("I know an old lady who swallowed a cow.\n") +
                std::string("I don't know how she swallowed a cow!\n") +
                std::string("She swallowed the cow to catch the goat.\n") +
                std::string("She swallowed the goat to catch the dog.\n") +
                std::string("She swallowed the dog to catch the cat.\n") +
                std::string("She swallowed the cat to catch the bird.\n") +
                std::string("She swallowed the bird to catch the spider that wriggled and jiggled ") +
                std::string("and tickled inside her.\n") +
                std::string("She swallowed the spider to catch the fly.\n") +
                std::string("I don't know why she swallowed the fly. ") +
                std::string("Perhaps she'll die.\n");
        else if (v == 8)
            return
                std::string("I know an old lady who swallowed a horse.\n") +
                std::string("She's dead, of course!\n");
        else
            throw std::domain_error("");

}

    auto verses(int f, int t) -> std::string
    {
        std::string vs;

        for (int i = f; i <= t; i++)
        {
            vs = vs + verse(i);
            vs = vs + "\n";
        }

        return vs;
    }

    auto sing() -> std::string
    {
        return verses(1, 8);
    }

}  // namespace food_chain
