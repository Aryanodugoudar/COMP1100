module SafeIntDiv where

-- | safeIntDiv:
-- Given two Ints as input,
-- return a Maybe Int as output according to the following:
-- - if the second number is zero, return Nothing
-- - if the first number is not divisible by the second, return Nothing
-- - otherwise return the value of the first number divided by the second.
-- 
-- Hint: the Prelude provides two functions that may be useful
-- div :: Int -> Int -> Int divides two Ints, discarding the remainder;
-- rem :: Int -> Int -> Int gives the remainder of the division of two Ints.
--
-- Examples:
--
-- >>> safeIntDiv 8 0
-- Nothing
--
-- >>> safeIntDiv 8 3
-- Nothing
--
-- >>> safeIntDiv 8 4
-- Just 2

safeIntDiv :: Int -> Int -> Maybe Int
safeIntDiv a b
    |b==0 = Nothing
    |(rem a b) /=0 = Nothing
    |otherwise = Just (div a b)