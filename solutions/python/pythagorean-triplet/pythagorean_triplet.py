def triplets_with_sum(number):

    if (number < 12) or (number % 1 == 1):
        return []

    triplets = []

    for a in range(3, number // 3 + 1):
        a_sq = a*a
        n_minus_a = number - a
        for b in range(max((n_minus_a - a) // 2 + 1, a + 1), n_minus_a // 2 + 1):
            c = n_minus_a - b
            if a_sq + b*b == c*c:
                triplets.append([a, b, c])

    return triplets
