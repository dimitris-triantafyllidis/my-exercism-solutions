function saddlepoints(M)

    if M == []
        return []
    end

    rows, cols = size(M)
    candidates = NTuple{2,Int}[]

    for i in 1:rows
        row_max = maximum(M[i, :])
        for j in 1:cols
            column_min = minimum(M[:, j])
            if M[i, j] == row_max && M[i, j] == column_min
                push!(candidates, (i, j))
            end
        end
    end

    return candidates
end

saddlepoints([])
