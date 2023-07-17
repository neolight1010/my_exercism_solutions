module Pangram
  ( isPangram
  ) where

import Prelude

import Data.Enum as Enum
import Data.List (List)
import Data.Set (Set)
import Data.Set as Set
import Data.String as String
import Data.String.CodeUnits as StringCodeUnits

isPangram :: String -> Boolean
isPangram = Set.subset alphabetCharset <<< toCharset

alphabetCharset :: Set Char
alphabetCharset = Set.fromFoldable alphabet
  where
    alphabet :: List Char
    alphabet = Enum.enumFromTo 'a' 'z'

toCharset :: String -> Set Char
toCharset = Set.fromFoldable <<< toCharArray

toCharArray :: String -> Array Char
toCharArray = StringCodeUnits.toCharArray <<< String.toLower
