module Grains (square, total) where

square :: Integer -> Maybe Integer
square n
  | n <= 0 || n > 64 = Nothing
  | otherwise = (Just . square') n

square' :: Integer -> Integer
square' n = 2 ^ (n - 1)

total :: Integer
total = foldr ((+) . square') 0 [1..64]
