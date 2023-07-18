module CollatzConjecture
  ( collatz
  ) where

import Prelude

import Data.List.Lazy (iterate, takeWhile, length)
import Data.Maybe (Maybe(..))

collatz :: Int -> Maybe Int
collatz n
  | n <= 0 = Nothing
  | otherwise =
      Just <<< length <<< takeWhile (_ > 1) <<< iterate collatzTransform $ n


collatzTransform :: Int -> Int
collatzTransform n =
  if (mod n 2) == 0 then
    n / 2
  else
    3*n + 1
