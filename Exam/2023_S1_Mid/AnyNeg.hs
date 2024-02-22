module AnyNeg where

-- | anyNeg:
-- Given a product of three Ints (i.e. a triple) as input,
-- return True if any of the Ints are strictly less than zero.
-- Otherwise, return False.
--
-- Examples:
--
-- >>> anyNeg (2,0,-4)
-- True
--
-- >>> anyNeg (-2,0,-4)
-- True
--
-- >>> anyNeg (2,0,4)
-- False

anyNeg :: (Int,Int,Int) -> Bool
anyNeg (a,b,c)
    |a<0 || b<0 ||c<0 = True
    |otherwise = False