{-# LANGUAGE BinaryLiterals #-}

module SecretHandshake (handshake) where

import Data.Bits ((.&.))

handshake :: Int -> [String]
handshake n = reverseIfNecessary n unreversedActions
  where
    unreversedActions = actions >>= (\(bin, action) -> [action | testAction bin n])

    reverseIfNecessary :: Int -> [String] -> [String]
    reverseIfNecessary n' actions' = if shouldReverse n' then reverse actions' else actions'

actions :: [(Int, String)]
actions =
  [ (0b1, "wink"),
    (0b10, "double blink"),
    (0b100, "close your eyes"),
    (0b1000, "jump")
  ]

shouldReverse :: Int -> Bool
shouldReverse = testAction 0b10000

testAction :: Int -> Int -> Bool
testAction bin n = n .&. bin > 0
