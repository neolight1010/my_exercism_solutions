module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
  | n <= 0 = Nothing
  | otherwise = Just $ last (take n primes)

primes :: [Integer]
primes = filter isPrime [2..]

isPrime :: Integer -> Bool
isPrime n
  | n <= 1 = False
  | otherwise = all (\x -> not $ n `isDivisibleBy` x) [2 .. n - 1]

isDivisibleBy :: Integer -> Integer -> Bool
isDivisibleBy a b = a `mod` b == 0
