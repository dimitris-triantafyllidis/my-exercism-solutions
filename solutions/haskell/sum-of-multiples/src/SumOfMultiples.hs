module SumOfMultiples (sumOfMultiples) where

import Data.Set as Set

multiples :: Integer -> Integer -> [Integer]
multiples 0 _ = [0]
multiples n limit = takeWhile (< limit) [n, 2*n ..]

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples bases limit =
    let allMultiples = concatMap (`multiples` limit) bases
        unique       = Set.fromList allMultiples
    in sum unique
