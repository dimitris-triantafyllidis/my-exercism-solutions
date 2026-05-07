def letter_points(c):

    c = c.upper()

    if c in ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]:
        return 1
    elif c in ["D", "G"]:
        return 2
    elif c in ["B", "C", "M", "P"]:
        return 3
    elif c in ["F", "H", "V", "W", "Y"]:
        return 4
    elif c in ["K"]:
        return 5
    elif c in ["J", "X"]:
        return 8
    elif c in ["Q", "Z"]:
        return 10
    else:
        return 0

def score(word):

    pts = 0

    for letter in word:
        pts += letter_points(letter)

    return pts

