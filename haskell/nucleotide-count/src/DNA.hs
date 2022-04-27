{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}

module DNA (nucleotideCounts, nucleotideCountsElegant, Nucleotide (..)) where

import Data.Map (Map, fromListWith, insertWith)
import qualified Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = nucWorker (Right Map.empty)
  where
    nucWorker (Right m) "" = Right m
    nucWorker (Left x) _ = Left x
    nucWorker (Right m) (x:xs) = case toNucleotide x of
      Right n -> nucWorker (Right (insertWith (+) n 1 m)) xs
      Left s -> Left s

nucleotideCountsElegant :: String -> Either String (Map Nucleotide Int)
nucleotideCountsElegant xs = nucleotideCounts' <$> nucleotides
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
