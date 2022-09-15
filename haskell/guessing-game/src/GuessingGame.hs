module GuessingGame (reply) where

answer :: Int
answer = 42

reply :: Int -> String
reply guess
  | guess == answer = "Correct"
  | guess - 1 == answer || guess + 1 == answer = "So close"
  | guess < answer = "Too low"
  | otherwise = "Too high"
