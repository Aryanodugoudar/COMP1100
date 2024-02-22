module RepeatedPowers where

-- There is ONE function for you to complete in this file.

-- | repeatedPower:
--
-- Given two Integers as input,
-- their repeatedPower is defined as
-- repeatedPower x 0 = 1
-- repeatedPower x 1 = x
-- repeatedPower x 2 = x^x
-- repeatedPower x 3 = x^(x^x)
-- repeatedPower x 4 = x^(x^(x^x))
-- and so on.
--
-- If the second input is negative, return 1.
--
-- Examples:
--
-- >>> repeatedPower 4 0
-- 1
--
-- >>> repeatedPower 4 1
-- 4
--
-- >>> repeatedPower 3 2
-- 27
--
-- >>> repeatedPower 3 3
-- 7625597484987

repeatedPower :: Integer -> Integer -> Integer
repeatedPower = undefined