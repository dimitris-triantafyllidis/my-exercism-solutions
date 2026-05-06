import math

def score(x, y):

    r = math.sqrt(x * x + y * y)

    if r > 10:
        return 0
    elif r > 5:
        return 1
    elif r > 1:
        return 5
    else:
        return 10
