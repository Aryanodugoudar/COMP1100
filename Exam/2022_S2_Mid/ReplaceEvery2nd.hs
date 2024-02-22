module ReplaceEvery2nd where

-- Write a function 'replaceEvery2nd' that takes a given character and
-- replaces every 2nd character in a given string 's' with that character.
-- 
-- example:
--   replaceEvery2nd '#' "foobarbaz" = "f#o#a#b#z"
replaceEvery2nd :: Char -> String -> String
replaceEvery2nd a b= case b of
    (x:y:xs)-> x: a: replaceEvery2nd a xs
    (x:xs) -> x : xs


