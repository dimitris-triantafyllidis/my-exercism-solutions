#include "sublist.h"

#include <vector>

namespace sublist {

    auto sublist (
        const std::vector<int> &a,
        const std::vector<int> &b
    ) -> List_comparison
    {
        if (a.size() == b.size())
            if (a == b)
                return List_comparison::equal;
            else
                return List_comparison::unequal;
        else if (a.empty() && !b.empty())
            return List_comparison::sublist;
        else if (!a.empty() && b.empty())
            return List_comparison::superlist;
        else if (a.size() < b.size())
            for (std::size_t i = 0; i <= b.size() - a.size(); i++)
                for (std::size_t j = 0; j < a.size(); j++)
                    if ((j == a.size() - 1) && (a[j] == b[i + j]))
                        return List_comparison::sublist;
                    else if (a[j] != b[i + j])
                        break;
                    else
                        continue;
        else if (a.size() > b.size())
            for (std::size_t i = 0; i <= a.size() - b.size(); i++)
                for (std::size_t j = 0; j < b.size(); j++)
                    if ((j == b.size() - 1) && (b[j] == a[i + j]))
                        return List_comparison::superlist;
                    else if (b[j] != a[i + j])
                        break;
                    else
                        continue;
        else {}

        return List_comparison::unequal;
    }

}  // namespace sublist
