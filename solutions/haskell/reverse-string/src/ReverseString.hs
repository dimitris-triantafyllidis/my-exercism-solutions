module ReverseString (reverseString) where

reverseString :: String -> String
reverseString s =
    if s == "" then ""
    else last s : reverseString (init s)
