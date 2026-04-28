# Implement number base conversion

function all_your_base(digits, base_in, base_out)

    if base_in < 2 || base_out < 2
        throw(DomainError(""))
    end

    if digits == []
        return [0]
    end

    for i in eachindex(digits)
        if digits[i] < 0 || digits[i] >= base_in
            throw(DomainError(""))
        end
        digits[i] = digits[i] * base_in^(length(digits) - i)
    end

    n = sum(digits)

    if n == 0
        return [0]
    end

    digits_out = []

    while n > 0
        pushfirst!(digits_out, n % base_out)
        n = div(n, base_out)
    end

    return digits_out

end
