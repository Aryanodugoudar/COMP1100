module JumpAdd where

-- **This file is for both COMP1100 and COMP1130 students**

-- | jumpSumFive:
-- Given a positive Int as input,
-- return the sum of the numbers between that Int and 0,
-- counting down in multiples of 5.
--
-- For example, if the given value is 17,
-- it should add the numbers 17, 12, 7 and 2.
--
-- If the input is negative, return 0.
-- 
-- Examples:
--
-- >>> jumpSumFive (-5)
-- 0
--
-- >>> jumpSumFive 0
-- 0
--
-- >>> jumpSumFive 15
-- 30
--
-- >>> jumpSumFive 17
-- 38

jumpSumFive :: Int -> Int
jumpSumFive x
  | x <= 0    = 0
  | otherwise = x +  jumpSumFive (x-5)