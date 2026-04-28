module Acronym (abbreviate) where
import Data.Char (isAlpha, isUpper, toUpper)

insertSpaces :: String -> String
insertSpaces [] = []
insertSpaces (x : xs) = x : go xs
  where
    go [] = []
    go (c : cs)
        | null cs = c : cs
        | not (isUpper c) && isUpper (head cs) = c : ' ' : go cs
        | otherwise = c : go cs

abbreviate :: String -> String
abbreviate xs =
    map (toUpper . head) w
  where
    replace '-' = ' '
    replace c = c
    w = words (filter (\c -> isAlpha c || c == ' ') ((unwords . words . map replace) (insertSpaces xs)))
