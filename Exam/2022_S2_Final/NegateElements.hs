module NegateElements where

-- ***************************************************************************
-- write a function 'negateNth' that does the following: 
--   If the length of the list is odd, negates every (n - 1)th integer. 
--   otherwise if the list is even: 
--     negates every nth integer. 
-- negateNth returns the empty list if n is less than 2. 

-- | Negating elements in a list of integers.
--
-- >>> negateNth 0 [1, 2, 3, 4, 5]
-- []
--
-- >>> negateNth 2 [1, 2, 3]
-- [-1,-2,-3]
--
-- >>> negateNth 2 [1, 2, 3, 4]
-- [1,-2,3,-4]
--
-- >>> negateNth 3 []
-- []
--
-- >>> negateNth 3 [1, 2, 3]
-- [1,-2,3]

negateNth :: Integer -> [Integer] -> [Integer]
negateNth n list
    | n < 2 = []
    | odd (length list) = map (\(i, x) -> if i `mod` (n - 1) == 0 then -x else x) (zip [1..] list)
    | otherwise = map (\(i, x) -> if i `mod` n == 0 then -x else x) (zip [1..] list)


