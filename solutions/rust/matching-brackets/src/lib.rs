pub fn brackets_are_balanced(string: &str) -> bool {

    let mut stack = Vec::<char>::new();

    for c in string.chars() {
        if c == '(' || c == '[' || c == '{' {
            stack.push(c);
        }
        else if c == ')' {
            if stack.is_empty() || stack[stack.len() - 1] != '(' {
                return false;
            }
            stack.pop();
        }
        else if c == ']' {
            if stack.is_empty() || stack[stack.len() - 1] != '[' {
                return false;
            }
            stack.pop();
        }
        else if c == '}' {
            if stack.is_empty() || stack[stack.len() - 1] != '{' {
                return false;
            }
            stack.pop();
        }
    }

    return stack.is_empty();
}
