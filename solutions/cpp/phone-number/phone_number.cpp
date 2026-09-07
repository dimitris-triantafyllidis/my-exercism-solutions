#include "phone_number.h"

#include <cctype>
#include <stdexcept>
#include <algorithm>
#include <iterator>

namespace phone_number {

    phone_number::phone_number(const std::string &phone_number)
    {

        std::string f;
        f.reserve(phone_number.size());

        std::copy_if (
            phone_number.begin(),
            phone_number.end(),
            std::back_inserter(f),
            [] (unsigned char c) { return std::isdigit(c); }
        );

        if (
            f.size() == 10 &&
            (f[0] - '0' >= 2 ) &&
            (f[0] - '0' <= 9 ) &&
            (f[3] - '0' >= 2 ) &&
            (f[3] - '0' <= 9 )
        )
            m_number = f;
        else if (
            f.size() == 11 &&
            f[0] == '1' &&
            (f[1] - '0' >= 2 ) &&
            (f[1] - '0' <= 9 ) &&
            (f[4] - '0' >= 2 ) &&
            (f[4] - '0' <= 9 )
        )
            m_number = f.substr(1);
        else
            throw std::domain_error("");
    }

    auto phone_number::number() -> const std::string &
    {
        return m_number;
    }

}  // namespace phone_number
