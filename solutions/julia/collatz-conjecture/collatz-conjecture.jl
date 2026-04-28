function collatz_steps(n)
    if n <= 0
        throw(DomainError(n))
    end

    s = 0

    while n > 1
        n % 2 == 0 ? n = n / 2 : n = 3n + 1
        s += 1
    end

    return s

end
