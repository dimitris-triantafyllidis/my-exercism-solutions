module Triplet (tripletsWithSum) where

tripletsWithSum :: Int -> [(Int, Int, Int)]
tripletsWithSum sum =
    [ (a, b, c)
    | a <- [1..sum]
    , b <- [1..sum-a]
    , let c = sum - b - a
    , c*c == a*a + b*b && a < b && b < c
    ]
