module Largest where

-- | nLargest:
-- Given a tuple of three Doubles and an Int,
-- If Int is 1, reutrn the Double that is the largest.
-- If Int is 3, return the Double that is the smallest.
-- If Int is 2, return the Double that is in the middle when ordered.
-- If Int is not 1,2 or 3, return Nothing.  
--
-- Examples:
--
-- >>> nLargest (1.0, 1.0, 1.0) 3
-- Just 1.0
--
-- >>> nLargest (1.0, 1.5, 2.0) 1
-- Just 2.0
--
-- >>> nLargest (0.1, 5.6, 10.3) 0
-- Nothing

nLargest :: (Double, Double, Double) -> Int -> Maybe Double
nLargest (a,b,c) z
    |z==1 = Just large
    |z==3 = Just small
    |z==2 = Just b
    |otherwise = Nothing
    where
        large
            |a>b && a>c = a
            |b>a && b>c = b
            |c>b && c>b = c
            |a==b && b==c = a

        small
            |a<b && a<c = a
            |b<a && b<c = b
            |c<b && c<b = c
            |a==b && b==c = a
