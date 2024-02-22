module Reverse where

-- ***************************************************************************
-- write a function 'rev1' to reverse a list in linear, that is,
-- in O(n) time, where n is the length of the list.
--
-- You may NOT use the Prelude function 'reverse', or 
-- the Prelude function 'flip'.

-- a useful infinite stream to test your reverse function:
ones :: [Integer]
ones = 1 : ones

-- your rev1 function should take approximately the same time as 
-- 'reverse (take n ones)' for large n.
-- i.e 'reverse (take 1000000 ones)' should take roughly the same time as
--     'rev1 (take 1000000 ones)'

-- | Reversing a list in linear time.
--
-- >>> rev1 []
-- []
--
-- >>> rev1 [1, 2, 3, 4, 5]
-- [5,4,3,2,1]
--
-- >>> rev1 (rev1 "hello")
-- "hello"
--
-- >>> (rev1 . rev1 . rev1) "test"
-- "tset"
--
-- >>> rev1 [1]
-- [1]

rev1 :: [a] -> [a]
rev1 xs = reverse' xs []
  where
    reverse' :: [a] -> [a] -> [a]
    reverse' [] acc = acc
    reverse' (x:xs) acc = reverse' xs (x : acc)

