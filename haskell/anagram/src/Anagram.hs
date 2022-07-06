module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (\x -> (toAnagramId x == orderedXs) && (allLower x /= allLower xs))
  where
    orderedXs = toAnagramId xs
    allLower = map toLower
    toAnagramId = sort . allLower
