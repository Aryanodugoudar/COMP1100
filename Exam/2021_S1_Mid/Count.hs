module Count where

-- | countOccur:
-- Given a Char and a String as inputs,
-- find the number of occurrence of the Char in the String.
--
-- Examples:
--
-- >>> countOccur 'a' "aaabbb"
-- 3
--
-- >>> countOccur 'b' ""
-- 0
--

countOccur :: Char -> String -> Int
countOccur ch st = length(filter (==ch) st)

-- | countOccurMost:
-- Given a String as input, 
-- find the character which occurs most frequently in the String.
-- When more than two characters have the same number of occurrences, 
-- you can return any of the characters. 
-- Return Nothing if the input String is empty.
-- 
-- Examples:
-- 
-- >>> countOccurMost "abcabca"
-- Just 'a'
--
-- >>> countOccurMost ""
-- Nothing
--
  
countOccurMost :: String -> Maybe Char
countOccurMost "" = Nothing
countOccurMost str
  | null maxGroups = Nothing
  | otherwise = Just $ head $ head maxGroups
  where
    charGroups = group $ sort str
    maxLength = maximum $ map length charGroups
    maxGroups = filter (\group -> length group == maxLength) charGroups


