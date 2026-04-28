module Palindromes (largestPalindrome, smallestPalindrome) where

import Data.List (sortOn)

isPalindrome :: Integer -> Bool
isPalindrome n = show n == reverse (show n)

palindromes :: Integer -> Integer -> [(Integer, Integer)]
palindromes minFactor maxFactor =
    [ (m, n)
    | n <- [minFactor..maxFactor]
    , m <- [n..maxFactor]
    , let p = m * n
    , isPalindrome p
    ]

sortByProduct :: [(Integer, Integer)] -> [(Integer, Integer)]
sortByProduct = sortOn (uncurry (*))

largestPalindrome :: Integer -> Integer -> Maybe (Integer, [(Integer, Integer)])
largestPalindrome minFactor maxFactor
    | null ps = Nothing
    | otherwise = Just (p, [(m, n) | (m, n) <- pss, m * n == p ])
  where
      ps = palindromes minFactor maxFactor
      pss = reverse (sortByProduct ps)
      p = uncurry (*) (head pss)

smallestPalindrome :: Integer -> Integer -> Maybe (Integer, [(Integer, Integer)])
smallestPalindrome minFactor maxFactor
    | null ps = Nothing
    | otherwise = Just (p, [(m, n) | (m, n) <- pss, m * n == p ])
  where
      ps = palindromes minFactor maxFactor
      pss = reverse (sortByProduct ps)
      p = uncurry (*) (last pss)
