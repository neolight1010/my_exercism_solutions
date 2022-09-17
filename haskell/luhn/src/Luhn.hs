module Luhn (isValid) where

isValid :: String -> Bool
isValid xs
  | length normalized <= 1 = False
  | otherwise = validateDigits . getDigits $ normalized
  where
    normalized = normalize xs

normalize :: String -> String
normalize = filter (/= ' ')

getDigits :: String -> [Int]
getDigits = map (read . (: ""))

validateDigits :: [Int] -> Bool
validateDigits = (== 0) . (`mod` 10) . sum . transformDigits

transformDigits :: [Int] -> [Int]
transformDigits = zipWith transformDigit [0 :: Int ..] . reverse

transformDigit :: Int -> Int -> Int
transformDigit i x
  | odd i = reduceIfLarge . (* 2) $ x
  | otherwise = x
  where
    reduceIfLarge n = if n > 9 then n - 9 else n
