{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import Data.Char (isLetter, isSpace, isUpper)
import Data.Text (Text)
import qualified Data.Text as T

isQuestion :: Text -> Bool
isQuestion = T.isSuffixOf "?"

isYelling :: Text -> Bool
isYelling text = T.length filteredText > 0 && T.all isUpper filteredText
  where
    filteredText = filterOutNonLetters text
    filterOutNonLetters = T.filter isLetter

isSilence :: Text -> Bool
isSilence = T.all isSpace

responseFor :: Text -> Text
responseFor text
  | isQuestion stripped && isYelling stripped = "Calm down, I know what I'm doing!"
  | isYelling stripped = "Whoa, chill out!"
  | isQuestion stripped = "Sure."
  | isSilence stripped = "Fine. Be that way!"
  | otherwise = "Whatever."
  where
    stripped = T.strip text
