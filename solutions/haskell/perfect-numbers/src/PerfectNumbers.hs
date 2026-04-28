module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

aliquotFactors :: Int -> [Int]
aliquotFactors n = [m | m <- [1..n-1], mod n m == 0]

aliquotSum :: Int -> Int
aliquotSum n = sum (aliquotFactors n)

classify :: Int -> Maybe Classification
classify n
    | n <= 0 = Nothing
    | n == s = Just Perfect
    | n < s = Just Abundant
    | n > s = Just Deficient
    | otherwise = Nothing
  where s = aliquotSum n
