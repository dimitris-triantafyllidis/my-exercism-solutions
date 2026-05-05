#include <string>
#include <vector>

namespace election {

// The election result struct is already created for you:

struct ElectionResult {
    // Name of the candidate
    std::string name{};
    // Number of votes the candidate has
    int votes{};
};

int vote_count(const ElectionResult &result)
{
    return result.votes;
}

void increment_vote_count(ElectionResult &result, int amount)
{
    result.votes += amount;
}

ElectionResult &determine_result(std::vector<ElectionResult> &result)
{
    std::size_t idx_max = 0;
    std::size_t votes_max = 0;

    for (std::size_t i = 0; i < result.size(); i++)
    {
        if (result[i].votes >= votes_max)
        {
            votes_max = result[i].votes;
            idx_max = i;
        }
    }

    result[idx_max].name = "President " + result[idx_max].name;

    return result[idx_max];
}


// determine_result receives the reference to a final_count and returns a
// reference to the `ElectionResult` of the new president. It also changes the
// name of the winner by prefixing it with "President". The final count is given
// in the form of a `reference` to `std::vector<ElectionResult>`, a vector with
// `ElectionResults` of all the participating candidates.

}  // namespace election
