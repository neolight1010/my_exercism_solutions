module SumOfMultiples (sumOfMultiples) where

import Data.List (group, sort)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum uniqueMultiples
  where
    uniqueMultiples = removeDuplicates allFactors
    removeDuplicates = map head . group . sort
    allFactors = concatMap factorsUntilLimit factors
    factorsUntilLimit factor = factorsOf factor limit

factorsOf :: Integer -> Integer -> [Integer]
factorsOf 0 _ = []
factorsOf x limit = [0, x .. limit - 1]
