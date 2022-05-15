module Acronym (abbreviate) where

import Data.Char (toUpper, isLower, isUpper)

abbreviate :: String -> String
abbreviate = map (toUpper . head) . words . wordify

wordify :: String -> String
wordify (c1:c2:cs)
  | isLower c1 && isUpper c2 = c1 : ' ' : c2 : wordify cs

wordify ('-' : cs) = ' ' : wordify cs
wordify ('_' : cs) = ' ' : wordify cs
wordify (c1 : cs) = c1 : wordify cs
wordify "" = ""
