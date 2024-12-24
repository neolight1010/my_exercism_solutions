module Darts (score) where

score :: Float -> Float -> Int
score x y
  | dartDistance > 10 = 0
  | dartDistance > 5 = 1
  | dartDistance > 1 = 5
  | otherwise = 10
  where
    dartDistance = distance x y

distance :: Float -> Float -> Float
distance x y = sqrt (x * x + y * y)
