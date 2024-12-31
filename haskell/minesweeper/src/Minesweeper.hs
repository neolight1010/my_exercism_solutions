{-# LANGUAGE TupleSections #-}

module Minesweeper (annotate) where

import Data.Maybe (catMaybes)

annotate :: [String] -> [String]
annotate board =
  let annotatedBoard = deepZip (countBoard board) board
      showCount (count, value)
        | value == '*' = '*'
        | count == 0 = ' '
        | otherwise = head $ show count
   in showCount <<$>> annotatedBoard

countBoard :: [[Char]] -> [[Int]]
countBoard board =
  let adjacents = adjacentsBoard board
   in countMines <<$>> adjacents

countMines :: [Char] -> Int
countMines = length . filter (== '*')

adjacentsBoard :: [[Char]] -> [[[Char]]]
adjacentsBoard board =
  (\(row, col, _) -> adjacentCells row col board) <<$>> indexedBoard board

indexedBoard :: [[Char]] -> [[(Int, Int, Char)]]
indexedBoard board =
  let indexedRows = deepIndexed board
   in map (\(colIndex, (rowIndex, c)) -> (rowIndex, colIndex, c)) <$> map indexed indexedRows

adjacentCells :: Int -> Int -> [[Char]] -> [Char]
adjacentCells row col board =
  let topLeft = boardSelect (row - 1) (col - 1) board
      top = boardSelect (row - 1) col board
      topRight = boardSelect (row - 1) (col + 1) board
      left = boardSelect row (col - 1) board
      right = boardSelect row (col + 1) board
      bottomLeft = boardSelect (row + 1) (col - 1) board
      bottom = boardSelect (row + 1) col board
      bottomRight = boardSelect (row + 1) (col + 1) board
   in catMaybes [topLeft, top, topRight, left, right, bottomLeft, bottom, bottomRight]

boardSelect :: Int -> Int -> [String] -> Maybe Char
boardSelect row col board = (board !? row) >>= (!? col)

(!?) :: [a] -> Int -> Maybe a
[] !? _ = Nothing
(x : _) !? 0 = Just x
(_ : xs) !? i = xs !? (i - 1)

indexed :: [a] -> [(Int, a)]
indexed = zip [0 ..]

deepIndexed :: [[a]] -> [[(Int, a)]]
deepIndexed xs = (\(rowIndex, row) -> map (rowIndex,) row) <$> indexed xs

(<<$>>) :: (a -> b) -> [[a]] -> [[b]]
(<<$>>) f = map (map f)

deepZip :: [[a]] -> [[b]] -> [[(a, b)]]
deepZip as bs =
  let zippedRows = zip as bs
   in map (uncurry zip) zippedRows
