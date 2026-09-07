import math

def is_prime(n):

    if n == 0 or n == 1:
        return False

    for m in range(2, int(math.ceil(math.sqrt(n)) + 1)):
        if n != m and n % m == 0:
            return False

    return True

def next_prime(n):

    m = n + 1

    while True:
        if is_prime(m):
            return m
        else:
            m += 1

    raise ValueError("")

def factors(n):

    fs = []

    current_test_factor = 2

    while n != 1:
        if n % current_test_factor == 0:
            n //= current_test_factor
            fs += [current_test_factor]
        else:
            current_test_factor = next_prime(current_test_factor)

    return fs
