module Scrabble (scoreLetter, scoreWord) where

import Data.Char as Char

scoreLetter :: Char -> Integer
scoreLetter letter
    | toUpper letter `elem` ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] =      1
    | toUpper letter `elem` ['D', 'G']                                         =      2
    | toUpper letter `elem` ['B', 'C', 'M', 'P']                               =      3
    | toUpper letter `elem` ['F', 'H', 'V', 'W', 'Y']                          =      4
    | toUpper letter == 'K'                                                    =      5
    | toUpper letter `elem` ['J', 'X']                                         =      8
    | toUpper letter `elem` ['Q', 'Z']                                         =      10
    | otherwise = 0

scoreWord :: String -> Integer
scoreWord word = sum (map scoreLetter word)
