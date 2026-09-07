#pragma once

#include <string>
#include <vector>

namespace anagram {

    class anagram
    {
        public:

            anagram(const std::string &subject);
            auto matches(const std::vector<std::string> &candidates) -> std::vector<std::string>;

        private:

            auto normalize(const std::string &s) -> std::string;
            auto to_lower(const std::string &s) -> std::string;
            std::string m_subject;
    };

}  // namespace anagram
