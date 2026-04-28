module Squares (difference, squareOfSum, sumOfSquares) where

difference :: Integral a => a -> a
difference n = squareOfSum n - sumOfSquares n

squareOfSum :: Integral a => a -> a
squareOfSum n = s * s
    where s = sum [1..n]

sumOfSquares :: Integral a => a -> a
sumOfSquares n = sum [m * m | m <- [1..n]]
