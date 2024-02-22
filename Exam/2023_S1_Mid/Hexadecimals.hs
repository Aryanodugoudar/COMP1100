module Hexadecimals where

-- DO NOT edit or delete this library import
import Data.Char

-- | hexadecimals:
-- Given a list of Ints as input,
-- return a String (list of Chars),
-- with each Int between 0 and 15 inclusive
-- replaced by its hexadecimal character.
--
-- (the hexadecimal characters are '0','1','2',...,'9','a','b',...,'f',
-- and are used to represent base 16 digits).
--
-- To achieve this, use a function in the Data.Char library with name and type
-- intToDigit :: Int -> Char
-- which converts Ints between 0 and 15 inclusive to hexadecimal characters,
-- but crashes with an error on any other Int.
--
-- If any Int in the list is not between 0 and 15 inclusive,
-- return the underscore character '_' in its place.
--
-- Examples:
--
-- >>> hexadecimals []
-- ""
--
-- >>> hexadecimals [0,1,10,25,15,35]
-- "01a_f_"

hexadecimals :: [Int] -> String
hexadecimals list = case list of
    [] -> ""
    x:xs 
        | x > 15 -> '_' : (hexadecimals xs)
        | otherwise -> intToDigit x : hexadecimals xs

