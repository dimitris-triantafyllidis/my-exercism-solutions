#pragma once

#include <string>

namespace phone_number {

    class phone_number
    {

    public:

        phone_number(const std::string &phone_number);

        auto number() -> const std::string &;

    private:

        std::string m_number;

    };

}  // namespace phone_number
