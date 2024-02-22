module Skiponacci where

-- | The Padovan sequence (also called 'skiponacci') is similar
-- to the Fibonacci sequence, except that the n-th number
-- is obtained by adding up the (n-3)-th and (n-2)-th number in
-- the sequence. (So it skips the (n-1)-th number.)
-- The skiponacci sequence starts with [1, 1, 1]. So, the first six
-- digits of the skiponacci sequence are [1, 1, 1, 2, 2, 3].
-- 
-- Write a function that, given a non-negative Int n as input,
-- returns the n-th skiponacci number
-- (where their index starts at zero)
-- i.e. send 0 to 1,
--           1 to 1,
--           2 to 1,
--           3 to 2, and so on.
-- If the input is negative, return 0.
-- Examples:
--
-- >>> skiponacci (-3)
-- 0
--
-- >>> skiponacci 0
-- 1
--
-- >>> skiponacci 6
-- 4

skiponacci :: Int -> Int
skiponacci n
    |n<0 =0
    |n==0 || n==1 || n==2 = 1
    |otherwise= skiponacci (n-3) + skiponacci (n-2)
