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

def prime(number):
    if number == 0:
        raise ValueError ("there is no zeroth prime")
    if number < 0:
        raise ValueError ("number must be positive")
    else:
        cnt = 1
        cur = 2
        while cnt < number:
            cur = next_prime(cur)
            cnt += 1

        return cur

