{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}

module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.Map (Map, fromListWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = nucleotideCounts' <$> nucleotides
  where
    nucleotides = mapM toNucleotide xs

nucleotideCounts' :: [Nucleotide] -> Map Nucleotide Int
nucleotideCounts' xs = fromListWith (+) $ map (,1) xs

toNucleotide :: Char -> Either String Nucleotide
toNucleotide = \case
  'A' -> Right A
  'C' -> Right C
  'G' -> Right G
  'T' -> Right T
  _ -> Left "Invalid nucleotide."
