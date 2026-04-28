function triangle(n)

    if n < 0
        throw(DomainError(n))
    end

    if n == 0
        return []
    elseif n == 1
        return [[1]]
    end

    t = Array{Array{Int64, 1}, 1}(undef, n)

    t[1] = [1]

    for m in 2:n
        t[m] = Array{Int64, 1}(undef, m)
        for k in 1:m
            t[m][k] = (k == 1 ? 0 : t[m-1][k-1]) + (k == m ? 0 : t[m-1][k])
        end
    end

    return t

end
