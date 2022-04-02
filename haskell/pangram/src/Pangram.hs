module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text =
  all (\c -> toLower c `elem` lowerText) ['a' .. 'z']
  where
    lowerText = map toLower text
