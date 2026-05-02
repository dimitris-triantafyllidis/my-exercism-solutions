#pragma once

#include <string>

namespace rna_transcription {

    auto to_rna(char n) -> char;
    auto to_rna(std::string s) -> std::string;

}  // namespace rna_transcription
