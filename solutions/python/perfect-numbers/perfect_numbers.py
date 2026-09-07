def aliquot_sum(number):

    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")

    sum = 0

    for i in range(1, number // 2 + 1):
        if number % i == 0:
            sum += i

    return sum

def classify(number):

    if number == aliquot_sum(number):
        return "perfect"
    elif number < aliquot_sum(number):
        return "abundant"
    else:
        return "deficient"
