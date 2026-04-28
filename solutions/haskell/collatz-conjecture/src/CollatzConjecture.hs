module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
    | n <= 0 = Nothing
collatz 1 = Just 0
collatz n
    | even n = fmap(+ 1) (collatz (div n 2))
    | otherwise = fmap(+ 1) (collatz (3 * n + 1))
