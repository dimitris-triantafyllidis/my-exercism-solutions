function square_root(n::Int64)

    if (n < 0)
        throw(DomainError(n))
    end

    min::Int128 = 0
    max::Int128 = typemax(Int64)

    while(true)
        candidate = div((min + max), 2)
        if candidate ^ 2 == n
            return candidate
        elseif candidate ^ 2 < n
            min = candidate
        elseif candidate ^ 2 > n
            max = candidate
        end
    end

end
