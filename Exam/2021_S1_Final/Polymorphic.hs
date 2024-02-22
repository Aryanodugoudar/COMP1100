module Polymorphic where

-- Do not edit type signatures
--
-- | occurNTimes
--
-- Given a positive Int and a list as input, determine if there is an
-- element in the list that appears at least the input Int number of
-- times.  If the list is empty, return False.
--
-- Examples: 
-- >>> occurNTimes 4 [4,5,2,3,6,4,3,2,8,5,11,3,3]
-- True
--
-- >>> occurNTimes 5 "rddgsddaaddflds"
-- True
--
-- >>> occurNTimes 0 ""
-- False
--
-- >>> occurNTimes 100 "34684323840shfdkledg"
-- False
--
-- >>> occurNTimes (-1) "hello"
-- True

occurNTimes :: Eq a => Int -> [a] -> Bool
occurNTimes = undefined -- TODO

-- | distribute
--
-- Given a list as input, return a list where equal elements are
-- grouped as a list.  The original order of elements should be
-- preserved.
--
-- Note that it is NOT necessary to complete the previous question
-- before attempting this question.
-- 
-- Examples: 
-- >>> distribute [1,2,3,1,4,3,7]
-- [[1,1],[2],[3,3],[4],[7]]
--
-- >>> distribute "abcabc"
-- ["aa","bb","cc"]
--
-- >>> distribute []
-- []

distribute :: Eq a => [a] -> [[a]]
distribute = undefined -- TODO
