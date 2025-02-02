module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = BST a (BST a) (BST a) | Empty deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty = Nothing
bstLeft (BST _ left _) = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight Empty = Nothing
bstRight (BST _ _ right) = Just right

bstValue :: BST a -> Maybe a
bstValue (BST a _ _) = Just a
bstValue Empty = Nothing

empty :: BST a
empty = Empty

fromList :: Ord a => [a] -> BST a
fromList = foldl (flip insert) Empty 

insert :: Ord a => a -> BST a -> BST a
insert x Empty = singleton x
insert x (BST root left right) =
  if x <= root then
    BST root (insert x left) right
  else
    BST root left (insert x right)

singleton :: a -> BST a
singleton x = BST x Empty Empty

toList :: BST a -> [a]
toList Empty = []
toList (BST root left right) = toList left ++ [root] ++ toList right
