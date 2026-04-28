module Darts (score) where

radius :: Float -> Float -> Float
radius x y = sqrt (x * x + y * y)

score :: Float -> Float -> Int
score x y
  | r > 10 = 0
  | r > 5 = 1
  | r > 1 = 5
  | otherwise = 10
  where
    r = radius x y
