module Sublist (sublist) where

sublist :: Eq a => [a] -> [a] -> Maybe Ordering
sublist xs ys
    | xs == ys = Just EQ
    | xs `elem` (slices (length xs) ys) = Just LT
    | ys `elem` (slices (length ys) xs) = Just GT
    | otherwise = Nothing

slice :: Eq a => Int -> Int -> [a] -> [a]
slice start end = take (end - start + 1) . drop start

slices :: Eq a => Int -> [a] -> [[a]]
slices n xs = [(slice i (i + n - 1) xs) | i <- [0..(length xs) - n]]
