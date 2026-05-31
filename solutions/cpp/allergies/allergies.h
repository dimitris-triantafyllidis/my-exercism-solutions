#pragma once

#include <string>
#include <map>
#include <unordered_set>

namespace allergies {

    class allergy_test {

    public:

        allergy_test(int allergy_score);
        auto is_allergic_to(const std::string &food) -> bool;
        auto get_allergies() -> std::unordered_set<std::string>;

    private:

        int m_allergy_score = 0;

        const std::map<std::string, int> m_food_scores = {
            { "eggs"         , 1   },
            { "peanuts"      , 2   },
            { "shellfish"    , 4   },
            { "strawberries" , 8   },
            { "tomatoes"     , 16  },
            { "chocolate"    , 32  },
            { "pollen"       , 64  },
            { "cats"         , 128 }
        };

    };

}  // namespace allergies
