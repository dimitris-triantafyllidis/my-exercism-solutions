function get_neighbours(board, positions, player)

    if isempty(positions)
        return Set()
    end

    new_positions = copy(positions)

    nc = length(board[1])
    nr = length(board)

    for p in positions
        r, c = p[1], p[2]
        if c > 1 && board[r][c - 1] == player
            push!(new_positions, (r, c - 1))
        end
        if c < nc && board[r][c + 1] == player
            push!(new_positions, (r, c + 1))
        end
        if r > 1 && board[r - 1][c] == player
            push!(new_positions, (r - 1, c))
        end
        if r < nr && board[r + 1][c] == player
            push!(new_positions, (r + 1, c))
        end
        if r < nr && c > 1 && board[r + 1][c - 1] == player
            push!(new_positions, (r + 1, c - 1))
        end
        if r > 1 && c < nc && board[r - 1][c + 1] == player
            push!(new_positions, (r - 1, c + 1))
        end
    end

    return new_positions

end

function connect(board)

    for r in eachindex(board)
        board[r] = filter(c -> !isspace(c), board[r])
    end

    nr = length(board)
    nc = length(board[1])

    o_positions = Set((1, c) for c in 1:nc if board[1][c] == 'O')

    while true
        o_positions_old = copy(o_positions)
        o_positions = get_neighbours(board, o_positions, 'O')
        if o_positions_old == o_positions
            for p in o_positions
                if p[1] == nr
                    return "O"
                end
            end
            break
        end
    end

    x_positions = Set((r, 1) for r in 1:nr if board[r][1] == 'X')

    while true
        x_positions_old = copy(x_positions)
        x_positions = get_neighbours(board, x_positions, 'X')
        if x_positions_old == x_positions
            for p in x_positions
                if p[2] == nc
                    return "X"
                end
            end
            break
        end
    end

    return ""

end
