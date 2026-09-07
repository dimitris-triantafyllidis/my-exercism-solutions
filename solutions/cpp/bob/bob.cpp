#include "bob.h"

#include <algorithm>

namespace bob {

    auto trim(const std::string &s) -> std::string
    {
        auto t = s;

        while (
            !t.empty() &&
            (
                t[0] == ' '  ||
                t[0] == '\t' ||
                t[0] == '\r' ||
                t[0] == '\n'
            )
        ) t.erase(0, 1);

        while (
            !t.empty() &&
            (
                t[t.length() - 1] == ' '  ||
                t[t.length() - 1] == '\t' ||
                t[t.length() - 1] == '\r' ||
                t[t.length() - 1] == '\n'
            )
        ) t.erase(t.length() - 1, 1);

        return t;
    }

    auto hey(const std::string &stimulus) -> std::string
    {
        auto t = trim(stimulus);

        auto is_silence = t == "";

        if (is_silence) return "Fine. Be that way!";

        auto is_question = t[t.length() - 1] == '?' && !(t[0] == '?');

        auto contains_letters =
            std::any_of (
                t.begin(),
                t.end(),
                [] (unsigned char c) { return std::isalpha(c); }
            );

        std::string u = t;
        std::transform (
            u.begin(),
            u.end(),
            u.begin(),
            [] (unsigned char c) { return std::toupper(c); }
        );

        auto is_yelling = contains_letters && u == t;

        if (is_question && is_yelling)
            return "Calm down, I know what I'm doing!";
        else if (is_question)
            return "Sure.";
        else if (is_yelling)
            return "Whoa, chill out!";
        else
            return "Whatever.";
    }

}  // namespace bob
