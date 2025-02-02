module Triangle (rows) where

rows :: Int -> [[Integer]]
rows n = take n pascal

pascal :: [[Integer]]
pascal = iterate nextPascal [1]

nextPascal :: [Integer] -> [Integer]
nextPascal xs = zipWith (+) (0:xs) (xs++[0])
