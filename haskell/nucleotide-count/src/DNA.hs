module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.Map (Map, fromListWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = nucleotideCounts' <$> nucleotides
  where 
    nucleotides = mapM toNucleotide xs

nucleotideCounts' :: [Nucleotide] -> Map Nucleotide Int
nucleotideCounts' xs = fromListWith (+) [(x, 1) | x <- xs]

toNucleotide :: Char -> Either String Nucleotide
toNucleotide c = case c of
  'A' -> Right A
  'C' -> Right C
  'G' -> Right G
  'T' -> Right T
  _ -> Left $ "Invalid nucleotide: " ++ show c
