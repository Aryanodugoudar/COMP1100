module SameSign where

-- | sameSign:
-- Given two Int as input,
-- Return True if both are positive,
--   or both are negative,
--   or both are zero.
-- Return False otherwise. 
--
-- Examples:
--
-- >>> sameSign 2 5
-- True
--
-- >>> sameSign 2 (-5)
-- False
--
-- >>> sameSign 2 0
-- False

sameSign :: Int -> Int -> Bool
sameSign a b
    |a>0 && b>0 || a==0 && b==0 || a<0 && b<0 = True
    |otherwise= False 