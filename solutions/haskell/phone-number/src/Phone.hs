module Phone (number) where

import Data.Char as Char

number :: String -> Maybe String
number xs
    | length digits == 10 && digits !! 0 `elem` ['2'..'9'] && digits !! 3 `elem` ['2'..'9'] = Just digits
    | length digits == 11 && digits !! 0 == '1' && digits !! 1 `elem` ['2'..'9'] && digits !! 4 `elem` ['2'..'9'] = Just (tail digits)
    | otherwise = Nothing
    where
        digits = filter Char.isDigit xs

