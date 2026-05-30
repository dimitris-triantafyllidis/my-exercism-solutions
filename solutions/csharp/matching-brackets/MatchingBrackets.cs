public static class MatchingBrackets
{
    public static bool IsPaired(string s)
    {
        Stack<char> stack = new();

        foreach (char c in s)
        {
            if (c == '(' || c == '[' || c == '{')
            {
                stack.Push(c);
            }
            else if (c == ')')
            {
                if (stack.Count == 0) return false;
                if (stack.Peek() != '(')
                    return false;
                else
                    stack.Pop();
            }
            else if (c == ']')
            {
                if (stack.Count == 0) return false;
                if (stack.Peek() != '[')
                    return false;
                else
                    stack.Pop();
            }
            else if (c == '}')
            {
                if (stack.Count == 0) return false;
                if (stack.Peek() != '{')
                    return false;
                else
                    stack.Pop();
            }
        }

        return stack.Count == 0;
    }
}
