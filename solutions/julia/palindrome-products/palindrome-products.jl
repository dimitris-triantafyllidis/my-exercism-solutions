@inline function is_palindrome(n::Int)
    rev = 0
    x = n
    while x > 0
        rev = rev * 10 + rem(x, 10)
        x = div(x, 10)
    end
    return rev == n
end

function palindromeproducts(low::Int, high::Int, smallest::Bool)

    if low > high
        throw(ArgumentError(""))
    end

    palindromes = [(i, j, i * j) for i in low:high for j in i:high if is_palindrome(i * j)]

    if !isempty(palindromes)
        palindrome = sort(palindromes, by = t -> t[3])[smallest ? 1 : end]
        factors = [[t[1], t[2]] for t in palindromes if t[3] == palindrome[3]]
        return (palindrome[3], factors)
    else
        return (nothing, [])
    end
end
