module Bob
  ( hey
  ) where

import Prelude

import Data.Array as Array
import Data.CodePoint.Unicode as Char
import Data.Maybe (isJust)
import Data.String (Pattern(..))
import Data.String as String
import Data.Tuple (Tuple(..))

hey :: String -> String
hey msg =
  case (Tuple (isQuestion msg) (isYelling msg)) of
    (Tuple true true) -> "Calm down, I know what I'm doing!"
    (Tuple true false) -> "Sure."
    (Tuple false true) -> "Whoa, chill out!"
    (Tuple false false) -> if isBlank msg then "Fine. Be that way!" else "Whatever."


isQuestion :: String -> Boolean
isQuestion = isJust <<< String.stripSuffix (Pattern "?")

isYelling :: String -> Boolean
isYelling msg = not (Array.null msgAlpha) && msgAlphaIsUpper
  where
    msgAlpha = Array.filter Char.isAlpha (String.toCodePointArray msg)
    msgAlphaIsUpper = Array.all Char.isUpper msgAlpha

isBlank :: String -> Boolean
isBlank = ((==) "") <<< String.trim
