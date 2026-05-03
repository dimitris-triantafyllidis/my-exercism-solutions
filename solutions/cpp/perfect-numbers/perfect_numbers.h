#pragma once

namespace perfect_numbers {

    enum class classification {
        deficient,
        perfect,
        abundant
    };

    auto classify(int n) -> classification;

}  // namespace perfect_numbers
