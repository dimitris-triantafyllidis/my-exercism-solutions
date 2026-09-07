#include "rna_transcription.h"

#include <stdexcept>

namespace rna_transcription {

    auto to_rna(char c) -> char
    {
        if      (c == 'C')  return 'G';
        else if (c == 'G')  return 'C';
        else if (c == 'A')  return 'U';
        else if (c == 'T')  return 'A';
        else                throw std::domain_error("");
    }

    auto to_rna(std::string s) -> std::string
    {
        for (char &c : s)
            c = to_rna(c);

        return s;
    }

}  // namespace rna_transcription
