{-# LANGUAGE LambdaCase #-}

module DNA (nucleotideCounts, Nucleotide (..)) where

import Control.Monad (foldM)
import Data.Map (Map, insertWith)
import qualified Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = foldM appendNucleotide Map.empty
  where
    appendNucleotide m c = increaseNucleotideCount m <$> toNucleotide c
    increaseNucleotideCount m n = insertWith (+) n 1 m

toNucleotide :: Char -> Either String Nucleotide
toNucleotide = \case
  'A' -> Right A
  'C' -> Right C
  'G' -> Right G
  'T' -> Right T
  _ -> Left "Invalid nucleotide."
