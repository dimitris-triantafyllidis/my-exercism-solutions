def triplets_with_sum(number):
    triplets = []

    for a in range(1, number + 1):
        for b in range(1, number - a + 1):
            c = number - b - a
            if a < b and b < c and a**2 + b**2 == c**2:
                triplets += [[a, b, c]]

    return triplets
