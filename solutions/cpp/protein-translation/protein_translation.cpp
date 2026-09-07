#include "protein_translation.h"

#include <map>
#include <stdexcept>

namespace protein_translation {

    std::map<std::string, std::string> codon_map = {
        {"AUG", "Methionine"},
        {"UUU", "Phenylalanine"},
        {"UUC", "Phenylalanine"},
        {"UUA", "Leucine"},
        {"UUG", "Leucine"},
        {"UCU", "Serine"},
        {"UCC", "Serine"},
        {"UCA", "Serine"},
        {"UCG", "Serine"},
        {"UAU", "Tyrosine"},
        {"UAC", "Tyrosine"},
        {"UGU", "Cysteine"},
        {"UGC", "Cysteine"},
        {"UGG", "Tryptophan"},
        {"UAA", "STOP"},
        {"UAG", "STOP"},
        {"UGA", "STOP"}
    };

    auto proteins(const std::string &strand) -> std::vector<std::string>
    {
        std::vector<std::string> amino_acids;

        for (std::size_t i = 0; i < strand.size() - 2; i += 3)
        {
            auto codon = strand.substr(i, 3);

            if (codon.size() != 3)
            {
                return amino_acids;
            }

            if (codon_map.find(codon) != codon_map.end())
                if (codon_map[codon] == "STOP")
                    return amino_acids;
                else
                    amino_acids.push_back(codon_map[codon]);
            else
                throw(std::domain_error(""));
        }

        return amino_acids;
    }

}  // namespace protein_translation
