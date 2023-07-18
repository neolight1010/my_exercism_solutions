module Accumulate
  ( accumulate
  ) where

import Data.List (List(..), (:))

accumulate :: forall a b. (a -> b) -> List a -> List b
accumulate f (x:xs) = (f x):(accumulate f xs)
accumulate _ _ = Nil
