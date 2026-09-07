function letter_points(c)

    c = uppercase(c)

    if c ∈ ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']
        return 1
    elseif c ∈ ['D', 'G']
        return 2
    elseif c ∈ ['B', 'C', 'M', 'P']
        return 3
    elseif c ∈ ['F', 'H', 'V', 'W', 'Y']
        return 4
    elseif c ∈ ['K']
        return 5
    elseif c ∈ ['J', 'X']
        return 8
    elseif c ∈ ['Q', 'Z']
        return 10
    else
        return 0
    end
end

function score(str)
    return sum(map(c -> letter_points(c), [c for c in str]))
end
