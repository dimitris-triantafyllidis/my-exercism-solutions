board_is_full(board) =
    !contains(board[1], ' ') &&
    !contains(board[2], ' ') &&
    !contains(board[3], ' ')

function board_contains_single_win(board, player)

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

    return win_count == 1

end

function gamestate(board)
    if board_contains_single_win(board, 'X') || board_contains_single_win(board, 'O')
        return "victory"
    end
end

