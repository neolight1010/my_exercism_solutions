module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List (transpose, find, intersperse)
import Data.Maybe (fromMaybe)

encode :: String -> String
encode xs = (concatRectangle rows . transpose . rectangle) normalized
  where
    normalized = normalize xs
    (rows, cols) = rectRowsCols $ length normalized

normalize :: String -> String
normalize = map toLower . filter isAlphaNum

rectangle :: String -> [[Char]]
rectangle xs = map (pad ' ' cols) $ splitEachN cols xs
  where
    (rows, cols) = rectRowsCols $ length xs

concatRectangle :: Int -> [String] -> String
concatRectangle rows = unwords . splitEachN rows . concat

rectRowsCols :: Int ->  (Int, Int)
rectRowsCols n = (rows, cols)
  where
    (rows, cols) = fromMaybe (1,1) $ find predicate [(x, y) | x <- [1..], y <- [x, x + 1]]

    predicate (r, c) = (r * c) >= n

-- | Splits a string into multiple strings every `n` characters.
splitEachN :: Int -> String -> [String]
splitEachN n xs
  | xs /= [] = take n xs : splitEachN n (drop n xs)
  | otherwise = []

pad :: Char -> Int -> String -> String
pad char minimumLength xs = xs ++ replicate padLength  char
  where
    padLength = minimumLength - length xs
