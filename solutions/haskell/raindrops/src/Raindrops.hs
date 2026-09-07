module Raindrops (convert) where

import Data.List as List

convert :: Int -> String
convert n
    | sound == "" = show n
    | otherwise = sound
    where
        sound =
            List.intercalate "" [
                if n `mod` 3 /= 0 then "" else "Pling",
                if n `mod` 5 /= 0 then "" else "Plang",
                if n `mod` 7 /= 0 then "" else "Plong"
            ]

