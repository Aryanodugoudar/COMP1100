module InLimits where

-- **This file is for COMP1100 STUDENTS ONLY**
-- **Do NOT attempt if you are a COMP1130 Student**

-- | inLimits:
-- Given three Ints as input,
-- call the first two Ints the 'limits'.
-- - If the third input is more than both limits, return the larger limit
-- - If the third input is less than both limits, return the smaller limit
-- - If the third input is between the limits, return it as the output.
--
-- Examples:
--
-- >>> inLimits 0 100 55
-- 55
--
-- >>> inLimits 100 0 55
-- 55
--
-- >>> inLimits 0 100 (-5)
-- 0
--
-- >>> inLimits 0 100 105
-- 100

inLimits :: Int -> Int -> Int -> Int
inLimits x y z
    |z>x && z>y = maximum [x,y]
    |z<x && z<y = minimum [x,y]
    |otherwise = z