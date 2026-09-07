module Anagram (anagramsFor) where

import Data.List as List
import Data.Char as Char

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (\s -> (not ((map Char.toLower xs) == (map Char.toLower s))) && (List.sort (map Char.toLower xs) == (List.sort  (map Char.toLower s)))) xss
