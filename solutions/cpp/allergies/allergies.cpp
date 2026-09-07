#include "allergies.h"
#include <unordered_set>

namespace allergies {

    allergy_test::allergy_test(int allergy_score) : m_allergy_score(allergy_score)
    {};

    auto allergy_test::is_allergic_to(const std::string &food) -> bool {
        return m_allergy_score & m_food_scores.at(food);
    }

    auto allergy_test::get_allergies() -> std::unordered_set<std::string> {

        std::unordered_set<std::string> allergies;

        for (const auto &[food, score] : m_food_scores) {
            if (m_allergy_score & m_food_scores.at(food)) {
                allergies.insert(food);
            }
        }

        return allergies;

    }

}  // namespace allergies
