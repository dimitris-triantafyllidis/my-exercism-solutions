#include "largest_series_product.h"

#include <stdexcept>
#include <algorithm>

namespace largest_series_product {

    auto largest_product(const std::string &s, int l) -> int
    {
        if (l < 1 || l > static_cast<int>(s.length()))
            throw std::domain_error("");

        std::vector<std::string> slices;

        for (std::size_t i = 0; i <= s.length() - l; i++)
        {
            slices.push_back(s.substr(i, l));
        }

        for (const auto &slice : slices)
        {
            bool is_valid =
                std::all_of (
                    slice.begin(),
                    slice.end(),
                    [](unsigned char ch) { return std::isdigit(ch); }
                );

            if (!is_valid)
                throw std::domain_error("");
        }

        std::vector<int> products;

        for (const auto &slice : slices)
        {
            int product = 1;

            for (const auto &c : slice)
            {
                product *= c - '0';
            }

            products.push_back(product);
        }

        return *std::max_element(products.begin(), products.end());
    }

}  // namespace largest_series_product
