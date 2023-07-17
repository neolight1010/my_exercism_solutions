module Leap
  ( isLeapYear
  ) where

import Prelude

isLeapYear :: Int -> Boolean
isLeapYear year =
  isYearDivisibleBy 4 && ((not isYearDivisibleBy 100) || (isYearDivisibleBy 400))
  where
    isYearDivisibleBy = isDivisible year

isDivisible :: Int -> Int -> Boolean
isDivisible dividend divisor = ((==) 0) $ mod dividend divisor
