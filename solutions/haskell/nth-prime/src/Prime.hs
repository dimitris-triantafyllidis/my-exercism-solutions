module Prime (nth) where

isPrime :: Integer -> Bool
isPrime n
    | n < 2 = False
    | otherwise = null factors
    where factors = [f | f <- [2..ceiling $ sqrt (fromInteger n)], mod n f == 0, f /= n]

nth :: Int -> Maybe Integer
nth 0 = Nothing
nth n = Just $ last $ take n [p | p <- [2..], isPrime p]
