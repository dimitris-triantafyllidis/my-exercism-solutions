function combinations_of_length(digits, n)

    result = []

    function dfs(start, path)

        if length(path) == n
            push!(result, copy(path))
            return
        end

        for i in start:length(digits)
            push!(path, digits[i])
            dfs(i + 1, path)
            pop!(path)
        end

    end

    dfs(1, [])

    return result
end

function combinations_in_cage(total, numsquares, restricted=nothing)

    valid_digits = [d for d in 1:9 if d ∉ something(restricted, [])]

    candidate_combo = [valid_digits[d] for d in 1:numsquares]

    if sum(candidate_combo) > total
        return []
    end

    valid_combos = combinations_of_length(valid_digits, numsquares)

    valid_combos = [combo for combo in valid_combos if sum(combo) == total]

    return valid_combos

end
