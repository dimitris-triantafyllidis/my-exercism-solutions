function aliquot_sum(n)
    if n < 1
        throw(DomainError(n))
    end
    sum = 0
    for i in 1:n-1
        sum += n % i == 0 ? i : 0
    end
    return sum
end

function isperfect(n)
    return n == aliquot_sum(n)
end

function isabundant(n)
    return n < aliquot_sum(n)
end

function isdeficient(n)
    return n > aliquot_sum(n)
end
