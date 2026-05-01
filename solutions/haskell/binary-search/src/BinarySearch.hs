module BinarySearch (find) where

import Data.Array

find :: Ord a => Array Int a -> a -> Maybe Int
find arr x
    | (fst (bounds arr)) > (snd (bounds arr)) = Nothing
    | otherwise = go (fst (bounds arr)) (snd (bounds arr))
        where
            go l u
                | x == arr ! l = Just l
                | x == arr ! u = Just u
                | u - l <= 1 = Nothing
                | x == arr ! m = Just m
                | x < arr ! m = go l m
                | x > arr ! m = go m u
                | otherwise = Nothing
                    where m = (u + l) `div` 2
