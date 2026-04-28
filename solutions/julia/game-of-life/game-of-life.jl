function gameoflife(matrix)
    next = zeros(size(matrix))

    for i in CartesianIndices(next)

        sum::Int = 0

        if i[1] > 1             && i[2] > 1             sum = sum + matrix[i + CartesianIndex(-1, -1)] end
        if i[1] > 1                                     sum = sum + matrix[i + CartesianIndex(-1,  0)] end
        if i[1] > 1             && i[2] < size(next)[2] sum = sum + matrix[i + CartesianIndex(-1,  1)] end
        if                         i[2] > 1             sum = sum + matrix[i + CartesianIndex( 0, -1)] end
        if                         i[2] < size(next)[2] sum = sum + matrix[i + CartesianIndex( 0,  1)] end
        if i[1] < size(next)[1] && i[2] > 1             sum = sum + matrix[i + CartesianIndex( 1, -1)] end
        if i[1] < size(next)[1]                         sum = sum + matrix[i + CartesianIndex( 1,  0)] end
        if i[1] < size(next)[1] && i[2] < size(next)[2] sum = sum + matrix[i + CartesianIndex( 1,  1)] end

        if matrix[i] == 0 && sum == 3
            next[i] = 1
        elseif matrix[i] == 1 && (sum == 2 || sum == 3)
            next[i] = 1
        else
            next[i] = 0
        end
    end

    return next

end
