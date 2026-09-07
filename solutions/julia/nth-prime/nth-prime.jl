function is_prime(n::Int)

    if n == 0 || n == 1
        return false
    end

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

function prime(num)

    if num < 1
        throw(ErrorException("No such prime!"))
    end

    p = 0

    for i in 1:num
        p = next_prime(p)
    end

    return p

end
