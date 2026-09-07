def is_paired(input_string):

    stack = []

    for c in input_string:
        if c == "(" or c == "[" or c == "{":
            stack.append(c)
        elif c == ")":
            if stack == []:
                return False
            if stack[-1] != "(":
                return False
            else:
                stack.pop()
        elif c == "]":
            if stack == []:
                return False
            if stack[-1] != "[":
                return False
            else:
                stack.pop()
        elif c == "}":
            if stack == []:
                return False
            if stack[-1] != "{":
                return False
            else:
                stack.pop()

    return stack == []
