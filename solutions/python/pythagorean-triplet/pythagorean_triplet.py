def triplets_with_sum(number):

    triplets = []

    for a in range(1, number // 3 + 1):
        a_sq = a*a
        n_minus_a = number - a
        for b in range(a + 1, (number - a) // 2 + 1):
            c = n_minus_a - b
            if a_sq + b*b == c*c:
                triplets.append([a, b, c])

    return triplets
