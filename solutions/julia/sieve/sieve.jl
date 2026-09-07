function sieve(limit)

    primes = [n for n in 2:limit]

    for n in primes
        primes = filter(c -> c ∉ 2n:n:limit, primes)
    end

    return primes

end
