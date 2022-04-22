module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = mapM complement

complement :: Char -> Either Char Char
complement c = case c of
    'G' -> Right 'C'
    'C' -> Right 'G'
    'T' -> Right 'A'
    'A' -> Right 'U'
    _   -> Left c
