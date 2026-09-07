def is_valid(s):

    if len(s) == 13 and (s[1] == s[5] == s[11] == '-'):
        s = s[0] + s[2:5] + s[6:11] + s[12]
    elif len(s) != 10:
        return False

    d = [0 for i in range(0, 10)]

    for i in range(0, 10):
        c = s[i]
        if c.isdigit():
            d[i] = int(c)
        elif i == 9 and c == "X":
            d[i] = 10
        else:
            return False

    return (
        d[0] * 10 + d[1] * 9 + d[2] * 8 + d[3] * 7 + d[4] * 6 +
        d[5] * 5 + d[6] * 4 + d[7] * 3 + d[8] * 2 + d[9] * 1
    ) % 11 == 0
