module DNA (nucleotideCounts, Nucleotide(..)) where

import qualified Data.Map.Strict as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

type NucleotideCountMap = Map.Map Nucleotide Integer

nextNucleotide :: Char -> Either String Nucleotide
nextNucleotide c
    | c == 'A' = Right A
    | c == 'C' = Right C
    | c == 'G' = Right G
    | c == 'T' = Right T
    | otherwise = Left "invalid nucleotide character in input string"

incrementNucleotideCount :: NucleotideCountMap -> Nucleotide -> NucleotideCountMap
incrementNucleotideCount counts nucleotide = Map.insertWith (+) nucleotide 1 counts

nucleotideCounts :: String -> Either String NucleotideCountMap
nucleotideCounts dna = do
    ns <- traverse nextNucleotide dna
    pure (foldl incrementNucleotideCount initialCounts ns)
  where initialCounts = Map.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]
