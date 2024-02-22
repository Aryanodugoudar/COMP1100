module Sentence where

-- | The function 'sentence' has as input a list of strings.
-- It outputs a single string, obtained from the list of strings
-- by combining them into a single string with spaces between
-- them. The function 'sentence' does not add spaces at the
-- start or end, only in between the input strings.
--
-- Hint: the Prelude provides the function
-- (++) :: String -> String -> String
-- which appends two Strings together.
-- (++) is usually written infix (between its arguments)
-- and without the parentheses, e.g. "hello" ++ " " ++ "world"
-- gives "hello world"
--
-- Examples:
-- 
-- >>> sentence ["Hello", "world"]
-- "Hello world"
--
-- >>> sentence []
-- ""
--
-- >>> sentence ["Haskell", "is", "fun!"]
-- "Haskell is fun!"

sentence :: [String] -> String
sentence [] = ""
sentence [x] = x
sentence list = head(list) ++" " ++sentence (tail(list))