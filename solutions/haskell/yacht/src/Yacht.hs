module Yacht (yacht, Category(..)) where

import Data.List as List

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht
    deriving Eq

diceFaceOccurences :: [Int] -> Int -> Int
diceFaceOccurences ds f = length $ filter (f ==) ds

yacht :: Category -> [Int] -> Int
yacht category dice
    | category == Ones           = diceFaceOccurences dice 1
    | category == Twos           = diceFaceOccurences dice 2 * 2
    | category == Threes         = diceFaceOccurences dice 3 * 3
    | category == Fours          = diceFaceOccurences dice 4 * 4
    | category == Fives          = diceFaceOccurences dice 5 * 5
    | category == Sixes          = diceFaceOccurences dice 6 * 6
    | category == LittleStraight && diceSorted == [1, 2, 3, 4, 5] = 30
    | category == BigStraight    && diceSorted == [2, 3, 4, 5, 6] = 30
    | category == Choice         = sum dice
    | category == Yacht          && length (nub dice) == 1 = 50
    | category == FourOfAKind =
        if      diceFaceOccurences dice 1 >= 4 then 4
        else if diceFaceOccurences dice 2 >= 4 then 8
        else if diceFaceOccurences dice 3 >= 4 then 12
        else if diceFaceOccurences dice 4 >= 4 then 16
        else if diceFaceOccurences dice 5 >= 4 then 20
        else if diceFaceOccurences dice 6 >= 4 then 24
        else 0
    | category == FullHouse = if length (nub dice) == 2 && (yacht FourOfAKind dice == 0) then sum dice else 0
    | otherwise             = 0
    where
        diceSorted = sort dice
