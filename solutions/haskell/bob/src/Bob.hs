module Bob (responseFor) where
import Data.List (isPrefixOf, isSuffixOf)
import Data.Char (isAlpha, toUpper)

import Data.Char (isSpace)

strip :: String -> String
strip = f . f
    where f = reverse . dropWhile isSpace

responseFor :: String -> String
responseFor xs
    | isSilence = "Fine. Be that way!"
    | isQuestion && isYelling = "Calm down, I know what I'm doing!"
    | isQuestion = "Sure."
    | isYelling = "Whoa, chill out!"
    | otherwise = "Whatever."
    where xss = strip xs
          isSilence = xss == ""
          isQuestion = not ("?" `isPrefixOf` xss) && ("?" `isSuffixOf` xss)
          containsLetters = any isAlpha xss
          isYelling = containsLetters && (map toUpper xss == xss)

