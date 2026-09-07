def aliquot_sum(number):

    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")

    result = 0

    for i in range(1, number // 2 + 1):
        if number % i == 0:
            result += i

    return result

def classify(number):

    if number == aliquot_sum(number):
        return "perfect"

    if number < aliquot_sum(number):
        return "abundant"
    else:
        return "deficient"
