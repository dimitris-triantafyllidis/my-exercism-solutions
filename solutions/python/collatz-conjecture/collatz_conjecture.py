def steps(number):

    if number <= 0:
        raise ValueError("Only positive integers are allowed")

    s = 0

    while number > 1:
        if number % 2 == 0:
            number = number / 2
        else:
            number = 3 * number + 1
        s += 1

    return s
