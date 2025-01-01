module PerfectNumbers (classify, Classification (..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x =
  if x <= 0
    then Nothing
    else compareWithAliquot x (aliquot x)

compareWithAliquot :: Int -> Int -> Maybe Classification
compareWithAliquot n aliquot'
  | n == aliquot' = Just Perfect
  | aliquot' > n = Just Abundant
  | aliquot' < n = Just Deficient
  | otherwise = Nothing

aliquot :: Int -> Int
aliquot = sum . factors

factors :: Int -> [Int]
factors n = filter (isFactor n) [1..n-1]

isFactor :: Int -> Int -> Bool
isFactor a b = a `mod` b == 0
