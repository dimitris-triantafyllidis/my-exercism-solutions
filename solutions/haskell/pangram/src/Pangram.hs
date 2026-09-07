module Pangram (isPangram) where

import qualified Data.Set as Set
import qualified Data.Char as Char

isPangram :: String -> Bool
isPangram text = Set.size (Set.fromList (map Char.toLower (filter Char.isAlpha (filter  Char.isAscii text)))) == 26
