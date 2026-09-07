board_is_full(board) =
    !contains(board[1], ' ') &&
    !contains(board[2], ' ') &&
    !contains(board[3], ' ')

function board_win_count(board, player)

    win_count = count(
        identity,
        (
            board[1] == player^3,
            board[2] == player^3,
            board[3] == player^3,
            board[1][1] == board[2][1] == board[3][1] == player,
            board[1][2] == board[2][2] == board[3][2] == player,
            board[1][3] == board[2][3] == board[3][3] == player,
            board[1][1] == board[2][2] == board[3][3] == player,
            board[1][3] == board[2][2] == board[3][1] == player
        )
    )

    return win_count

end

function board_moves_valid(board)

    board_flat = board[1] * board[2]  * board[3]

    O_count = length(filter(c -> c == 'O', board_flat))
    X_count = length(filter(c -> c == 'X', board_flat))
    O_win_count = board_win_count(board, 'O')
    X_win_count = board_win_count(board, 'X')

    return X_count - O_count ∈ [0, 1] && (X_win_count == 0 || O_win_count == 0)

end

function gamestate(board)

    if !board_moves_valid(board)
        throw(ErrorException(""))
    end

    if board_win_count(board, 'X') ∈ [1, 2] || board_win_count(board, 'O') ∈ [1, 2]
        return "win"
    elseif !board_is_full(board)
        return "ongoing"
    elseif board_is_full(board)
        return "draw"
    end
end
