{-# LANGUAGE LambdaCase #-}

module DNA (nucleotideCounts, Nucleotide (..)) where

import Control.Monad (foldM, (>=>))
import Data.Map (Map, insertWith)
import qualified Data.Map as Map
import Numeric.Natural (Natural)

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

--------------------------

data NucleotideCounts = NucleotideCounts
  { getAs :: Natural,
    getCs :: Natural,
    getGs :: Natural,
    getTs :: Natural
  }
  deriving (Show)

instance Monoid NucleotideCounts where
  mempty = NucleotideCounts 0 0 0 0

instance Semigroup NucleotideCounts where
  (<>) a b =
    NucleotideCounts
      { getAs = getAs a + getAs b,
        getCs = getCs a + getCs b,
        getGs = getGs a + getGs b,
        getTs = getTs a + getTs b
      }

nucleotideToNucleotideCounts :: Nucleotide -> NucleotideCounts
nucleotideToNucleotideCounts n = case n of
  A -> mempty {getAs = 1}
  C -> mempty {getCs = 1}
  G -> mempty {getGs = 1}
  T -> mempty {getTs = 1}
