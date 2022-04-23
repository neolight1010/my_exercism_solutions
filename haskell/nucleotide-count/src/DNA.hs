module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.Map (Map, fromList, fromListWith, toList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = fromList <$> mapM toNucleotideCountTuple (charCountList xs)

toNucleotideCountTuple :: (Char, Int) -> Either String (Nucleotide, Int)
toNucleotideCountTuple (char, count) = case toNucleotide char of
  Right n -> Right (n, count)
  Left c -> Left $ show c

charCountList :: String -> [(Char, Int)]
charCountList xs = toList $ fromListWith (+) [(x, 1) | x <- xs]

toNucleotide :: Char -> Either Char Nucleotide
toNucleotide c = case c of
  'A' -> Right A
  'C' -> Right C
  'G' -> Right G
  'T' -> Right T
  _ -> Left c
