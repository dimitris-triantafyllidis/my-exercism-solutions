#include "matching_brackets.h"

#include <stack>

namespace matching_brackets {

    auto check(const std::string &s) -> bool
    {
        std::stack<char> stack;

        for (auto c : s)
        {
            if (c == '(' || c == '[' || c == '{')
            {
                stack.push(c);
            }
            else if (c == ')')
            {
                if (stack.empty()) return false;
                if (stack.top() != '(')
                    return false;
                else
                    stack.pop();
            }
            else if (c == ']')
            {
                if (stack.empty()) return false;
                if (stack.top() != '[')
                    return false;
                else
                    stack.pop();
            }
            else if (c == '}')
            {
                if (stack.empty()) return false;
                if (stack.top() != '{')
                    return false;
                else
                    stack.pop();
            }
        }

        return stack.empty();
    }

}  // namespace matching_brackets
