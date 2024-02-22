module AnySum where

-- | anySum:
-- Given a product of three Ints (i.e. a triple) as input,
-- return True if there are two values in the triple whose sum
-- equals the remaining value of the triple. Otherwise, return False.
--
-- Examples:
--
-- >>> anySum (0, 0, 0)
-- True
--
-- >>> anySum (6, 7, 1)
-- True
-- 
-- >>> anySum (1, 10, 100)
-- False
--
-- The second example returns True because 1 + 6 = 7
-- 
-- The third example returns false because there are no two values
-- summing up to the last one. That is:
--   1 + 10 is not equal to 100,
--   1 + 100 is not equal to 10, 
--   10 + 100 is not equal to 1.

anySum :: (Int, Int, Int) -> Bool
anySum (x,y,z)
    |x+y==z || x+z==y || y+z==x = True
    |otherwise = False