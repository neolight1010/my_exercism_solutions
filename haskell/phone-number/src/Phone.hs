module Phone (number) where

import Data.Char (isDigit)

data PhoneNumber = Valid String | Invalid

number :: String -> Maybe String
number = dumpNumber . parseCleanNumber . cleanNonDigits

cleanNonDigits :: String -> String
cleanNonDigits = filter isDigit

parseCleanNumber :: String -> PhoneNumber
parseCleanNumber n
  | length n == 10 && validateAreaCode (head n) && validateAreaCode (n !! 3) = Valid n
  | length n == 11 && head n == '1' = parseCleanNumber (tail n)
  | otherwise = Invalid
  where
    validateAreaCode code = isDigit code && code /= '0' && code /= '1'

dumpNumber :: PhoneNumber -> Maybe String
dumpNumber (Valid n) = Just n
dumpNumber Invalid = Nothing
