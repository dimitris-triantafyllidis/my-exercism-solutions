function sum_of_multiples(limit, factors)

    m = []

    for factor in factors
        if factor != 0
            for i in 1 : typemax(Int)
                if factor * i < limit
                    append!(m, factor * i)
                else
                    break
                end
            end
        else
            append!(m, 0)
        end

    end

    if m == [] return 0 end

    return sum(Set(m))
end
