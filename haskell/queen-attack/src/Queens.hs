module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black =
  let charForCell whiteCell blackCell cell
        | whiteCell == Just cell = "W"
        | blackCell == Just cell = "B"
        | otherwise = "_"

      chars = [[charForCell white black (i, j) | j <- [0 .. 7]] | i <- [0 .. 7]]
   in unlines $ unwords <$> chars

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (q1Row, q1Col) (q2Row, q2Col) =
  let rowDist = abs (q1Row - q2Row)
      colDist = abs (q1Col - q2Col)
   in rowDist == 0 || colDist == 0 || rowDist == colDist
