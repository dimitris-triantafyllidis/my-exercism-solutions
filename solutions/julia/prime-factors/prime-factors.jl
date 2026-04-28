function is_prime(n::Int)
    for m in 2:Int(ceil(sqrt(n)))
        if n != m && n % m == 0
            return false
        end
    end
    return true
end

function next_prime(n::Int)
    for m in n + 1:typemax(Int)
        if is_prime(m)
            return m
        end
    end
    throw(DomainError(n))
end

function prime_factors(n)

    factors = []

    current_test_factor = 2

    while n != 1
        if n % current_test_factor == 0
            n /= current_test_factor
            push!(factors, current_test_factor)
        else
            current_test_factor = next_prime(current_test_factor)
        end
    end

    return factors

end
