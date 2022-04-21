module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just $ toInteger (length (collatzList [n]) - 1)

collatzList :: [Integer] -> [Integer]
collatzList xs
  | null xs = []
  | last xs == 1 = xs
  | otherwise = xs ++ collatzList [collatzStep $ last xs]

collatzStep :: Integer -> Integer
collatzStep n
  | even n = n `div` 2
  | otherwise = 3 * n + 1
