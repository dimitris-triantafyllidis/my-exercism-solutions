module Series (slices) where

import Data.Char as Char

charToInt :: Char -> Int
charToInt c = Char.ord c - Char.ord '0'

substring :: Int -> Int -> String -> String
substring start end = take (end - start + 1) . drop start

slices :: Int -> String -> [[Int]]
slices n xs = [map charToInt (substring i (i + n - 1) xs) | i <- [0..(length xs) - n]]
