module ListFunctions where

-- Note that there are TWO functions for you to complete in this file.
-- It is NOT necessary to complete the first function
-- before attempting the second.

-- | countCommas:
--
-- Given a String as input,
-- count the number of occurrences of the comma character ','.
--
-- Examples:
--
-- >>> countCommas ""
-- 0
--
-- >>> countCommas "Hello, world,,,"
-- 4

countCommas :: String -> Int
countCommas = undefined

-- | separate:
--
-- Given an Int, and a list, as input,
-- return a list of lists
-- with the same elements in the same order as the input list,
-- but split into lists of length determined by the input Int.
--
-- If the input Int is zero or negative, return [].
-- If the length of the input list is not divisible by the input Int,
-- The last list of the output should be shorter,
-- to contain the remaining elements.
--
-- Examples:
--
-- >>> separate 3 []
-- []
--
-- >>> separate (-2) [0,1,2,3,4,5,6,7,8,9]
-- []
--
-- >>> separate 3 [0,1,2,3,4,5,6,7,8,9]
-- [[0,1,2],[3,4,5],[6,7,8],[9]]

separate :: Int -> [a] -> [[a]]
separate = undefined