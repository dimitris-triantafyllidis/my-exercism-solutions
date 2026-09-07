def primes(limit):

    sieve = [i for i in range(0, limit + 1)]

    sieve[1] = 0

    for i in range(0, len(sieve)):
        if sieve[i] == 0:
            continue
        else:
            for m in range (i * i, len(sieve), i):
                sieve[m] = 0

    return [p for p in sieve if p != 0]
