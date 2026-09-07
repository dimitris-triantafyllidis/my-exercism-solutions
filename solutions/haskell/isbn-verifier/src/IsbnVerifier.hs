module IsbnVerifier (isbn) where

import Data.Char as Char
import Data.Maybe (isNothing)

isbnStep1 :: String -> Maybe String
isbnStep1 xs
    | (length xs == 13 && [xs !! 1, xs !! 5, xs !! 11] == "---") || (length xs == 10) = Just $ filter (/= '-') xs
    | otherwise = Nothing

isbnStep2 :: Maybe String -> Maybe [Int]
isbnStep2 Nothing = Nothing
isbnStep2 (Just xs)
    | length (filter (`elem` "0123456789") (init xs)) == 9 && (last xs `elem` "0123456789X") = Just $ map (\c -> if isDigit c then ord c - ord '0' else 10) xs
    | otherwise = Nothing

isbn :: String -> Bool
isbn xs
    | isNothing mds = False
    | otherwise = (ds !! 0 * 10 + ds !! 1 * 9 + ds !! 2 * 8 + ds !! 3 * 7 + ds !! 4 * 6 + ds !! 5 * 5 + ds !! 6 * 4 + ds !! 7 * 3 + ds !! 8 * 2 + ds !! 9) `mod` 11 == 0
    where
        mds = isbnStep2 (isbnStep1 xs)
        Just ds = mds
