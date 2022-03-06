module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = isDiv4 && (not isCenturyYear || isLeapCenturyYear)
  where
    isDiv4 = isDiv 4 year
    isCenturyYear = isDiv 100 year
    isLeapCenturyYear = isDiv 400 year && isCenturyYear

isDiv :: Integer -> Integer -> Bool
isDiv x y = mod y x == 0
