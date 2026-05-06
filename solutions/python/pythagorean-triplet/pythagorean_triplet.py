def triplets_with_sum(number):
    triplets = []

    for c in range(3, number + 1):
        for b in range((number - c) / 2, number - c + 1):
            a = number - b - c
            if a < b and b < c and a**2 + b**2 == c**2:
                triplets += [[a, b, c]]

    return triplets
