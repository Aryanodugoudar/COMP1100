module StringTransformers where

-- Note that there are TWO functions for you to complete in this file.
-- It is NOT necessary to complete the first function
-- before attempting the second.

-- The import below may be useful for your answer to the second function.
-- If you do not use it, it will produce a warning.
-- You may ignore that warning.

import Data.Char

-- | progression:
-- Given three String as input,
-- use a Maybe type to return a String of length three,
--   whose first character is the first character of the first input String,
--   and second character is the second character of the second input String,
--   and third character is the third character of the third input String.
--
-- If this not possible
-- (i.e. an input String is too short to supply the required character)
-- return Nothing.
-- 
-- Examples:
--
-- >>> progression "foo" "bar" "qux"
-- Just "fax"
--
-- >>> progression "hello" "+" "world"
-- Nothing

progression :: String -> String -> String -> Maybe String
progression a b c
    |length a>=1 && length b>=2 && length c>=3 = Just (take 1 a ++ tail(take 2 b) ++ tail(tail(take 3 c)))
    |otherwise = Nothing

-- | shouting:
-- Given a String as input,
-- return that String unchanged, except that
-- - every lower case character in the input is now upper case;
-- - it has an exclamation mark '!' added to the end
--
-- Hint: the function
--   toUpper :: Char -> Char
-- in Data.Char maps lower case characters to upper case characters,
-- and leaves all other characters unchanged.
-- 
-- Examples:
--
-- >>> shouting ""
-- "!"
--
-- >>> shouting "Hello World"
-- "HELLO WORLD!"

shouting :: String -> String
shouting x= case x of
    ""->"!"
    (x:xs)-> toUpper x : shouting xs