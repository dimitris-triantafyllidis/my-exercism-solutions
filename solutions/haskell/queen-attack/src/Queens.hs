module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = [ cell r c | r <- [0..7], c <- [0..15]]
    where
        cell r c
            | c == 15 = '\n'
            | mod c 2 == 1 = ' '
            | white == Just (r, div c 2) = 'W'
            | black == Just (r, div c 2) = 'B'
            | otherwise =  '_'

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack queenA queenB =
    fst queenA == fst queenB ||
    snd queenA == snd queenB ||
    abs (fst queenA - fst queenB) == abs (snd queenA - snd queenB)
