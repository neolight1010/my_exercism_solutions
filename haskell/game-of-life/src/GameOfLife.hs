module GameOfLife (tick, adjacent) where

import Data.Maybe (catMaybes)

data Cell = Alive | Dead

type Board = [BoardRow]

type BoardRow = [Cell]

tick :: [[Int]] -> [[Int]]
tick = dumpBoard . tickBoard . parseBoard

tickBoard :: Board -> Board
tickBoard board =
  ( uncurry tickCell
      . \(i, j, cell) -> (cell, adjacent i j board)
  )
    <<$>> indexed2 board

tickCell :: Cell -> [Cell] -> Cell
tickCell Alive adj =
  let liveNeighbors = liveCells adj
   in if liveNeighbors == 2 || liveNeighbors == 3 then Alive else Dead
tickCell Dead adj =
  let liveNeighbors = liveCells adj
   in if liveNeighbors == 3 then Alive else Dead

adjacent :: Int -> Int -> [[a]] -> [a]
adjacent rowIndex colIndex board =
  let adjacentRowIndices = [rowIndex - 1 .. rowIndex + 1]
      adjacentColIndices = [colIndex - 1 .. colIndex + 1]
   in catMaybes
        [ (board !? i) >>= (!? j)
          | j <- adjacentColIndices,
            i <- adjacentRowIndices,
            (i, j) /= (rowIndex, colIndex)
        ]

liveCells :: [Cell] -> Int
liveCells = length . filter isAlive

isAlive :: Cell -> Bool
isAlive Alive = True
isAlive Dead = False

parseBoard :: [[Int]] -> [[Cell]]
parseBoard = map (map parseCell)
  where
    parseCell cellVal = if cellVal == 1 then Alive else Dead

dumpBoard :: Board -> [[Int]]
dumpBoard = (<<$>>) dumpCell
  where
    dumpCell Alive = 1
    dumpCell Dead = 0

(!?) :: [a] -> Int -> Maybe a
[] !? _ = Nothing
(x : _) !? 0 = Just x
(_ : xs) !? i = if i < 0 then Nothing else xs !? (i - 1)

indexed2 :: [[a]] -> [[(Int, Int, a)]]
indexed2 =
  map (\(i, xs) -> [(i, j, x) | (j, x) <- xs]) . indexed . map indexed

indexed :: [a] -> [(Int, a)]
indexed = zip [0 ..]

(<<$>>) :: (a -> b) -> [[a]] -> [[b]]
(<<$>>) f = map (map f)
