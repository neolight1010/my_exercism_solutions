module Temperature (tempToC, tempToF) where

tempToC :: Integer -> Float
tempToC temp = fromInteger (temp - 32) / 1.8

tempToF :: Float -> Integer
tempToF temp = ceiling $ (temp * 1.8) + 32
