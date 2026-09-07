def sum_of_multiples(limit, factors):

    m = []

    for factor in factors:
        if factor != 0:
            for i in range(1, limit // factor + 1):
                if factor * i < limit:
                    m.append(factor * i)
                else:
                    break
        else:
            m.append(0)

    if m == []:
        return 0

    return sum(set(m))
