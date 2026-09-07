def triplets_with_sum(number):

    triplets = []

    for a in range(1, number // 3 + 1):
        for b in range(a + 1, (number - a) // 2 + 1):
            c = number - (a + b)
            if a**2 + b**2 == c**2:
                triplets += [[a, b, c]]

    return triplets
