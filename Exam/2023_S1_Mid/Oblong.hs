module Oblong where

-- | oblong:
-- The 'oblong numbers' are the sequence 0,2,6,12,20,30,...
-- where the gap between each pair of numbers increases by 2 each time.
--
-- Write a function that, given a non-negative Int n as input,
-- returns the nth oblong number
-- (where their index starts at zero)
-- i.e. send 0 to 0,
--           1 to 2,
--           2 to 6, and so on.
-- If the input is negative, return 0.
--
-- Examples:
--
-- >>> oblong (-3)
-- 0
--
-- >>> oblong 0
-- 0
--
-- >>> oblong 3
-- 12

oblong :: Int -> Int
oblong a
    |a<=0 = 0
    |otherwise = a+(a*a)