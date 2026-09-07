module StateOfTicTacToe (gameState, GameState(..)) where

data GameState = WinX | WinO | Draw | Ongoing | Impossible deriving (Eq, Show)

boardIsFull :: [String] -> Bool
boardIsFull rows =
    notElem ' ' (rows !! 0) &&
    notElem ' ' (rows !! 1) &&
    notElem ' ' (rows !! 2)

winCount :: [String] -> Char -> Int
winCount rs p =
    (length . filter id) [
        rs !! 0 == [p, p, p],
        rs !! 1 == [p, p, p],
        rs !! 2 == [p, p, p],
        rs !! 0 !! 0 == p && rs !! 1 !! 0 == p && rs !! 2 !! 0 == p,
        rs !! 0 !! 1 == p && rs !! 1 !! 1 == p && rs !! 2 !! 1 == p,
        rs !! 0 !! 2 == p && rs !! 1 !! 2 == p && rs !! 2 !! 2 == p,
        rs !! 0 !! 0 == p && rs !! 1 !! 1 == p && rs !! 2 !! 2 == p,
        rs !! 0 !! 2 == p && rs !! 1 !! 1 == p && rs !! 2 !! 0 == p
    ]

boardMovesValid :: [String] -> Bool
boardMovesValid board =
    (elem (xMoveCount - oMoveCount) [0, 1]) && (xWinCount == 0 || oWinCount == 0)
    where
        boardFlat = board !! 0 ++ board !! 1 ++ board !! 2
        oMoveCount = length (filter (== 'O') boardFlat)
        xMoveCount = length (filter (== 'X') boardFlat)
        oWinCount = winCount board 'O'
        xWinCount = winCount board 'X'

gameState :: [String] -> GameState
gameState board
    | not (boardMovesValid board) = Impossible
    | winCount board 'X' `elem` [1, 2] = WinX
    | winCount board 'O' `elem` [1, 2] = WinO
    | not $ boardIsFull board = Ongoing
    | otherwise = Draw
