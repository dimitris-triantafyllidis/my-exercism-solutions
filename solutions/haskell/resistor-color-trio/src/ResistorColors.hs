module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> String
label resistor = show (ohms resistor `div` divider) ++ " " ++ prefix ++ "ohms"
    where
        ds = show (ohms resistor)
        prefix
          | length ds < 4 = ""
          | length ds < 7 = "kilo"
          | length ds < 10 = "mega"
          | otherwise = "giga"
        divider = 10 ^ (3 * div (length ds - 1) 3)

ohms :: Resistor -> Int
ohms (Resistor (a, b, c)) = (10 * fromEnum a + fromEnum b) * 10 ^ fromEnum c
