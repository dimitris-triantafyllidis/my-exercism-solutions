function annotate(arr)

    if isempty(arr)
        return []
    end

    w = length(arr[1])
    h = size(arr)[1]

    for r in 1:h
        row = collect(arr[r])
        for c in 1:w
            if arr[r][c] == ' '

                sum::Int = 0

                if r > 1 && c > 1 sum = sum + (arr[r - 1][c - 1] == '*' ? 1 : 0) end
                if r > 1          sum = sum + (arr[r - 1][c + 0] == '*' ? 1 : 0) end
                if r > 1 && c < w sum = sum + (arr[r - 1][c + 1] == '*' ? 1 : 0) end
                if          c > 1 sum = sum + (arr[r + 0][c - 1] == '*' ? 1 : 0) end
                if          c < w sum = sum + (arr[r + 0][c + 1] == '*' ? 1 : 0) end
                if r < h && c > 1 sum = sum + (arr[r + 1][c - 1] == '*' ? 1 : 0) end
                if r < h          sum = sum + (arr[r + 1][c + 0] == '*' ? 1 : 0) end
                if r < h && c < w sum = sum + (arr[r + 1][c + 1] == '*' ? 1 : 0) end

                if sum > 0
                    row[c] = Char('0' + sum)
                end
            end
        end
        arr[r] = String(row)
    end

    return arr

end
