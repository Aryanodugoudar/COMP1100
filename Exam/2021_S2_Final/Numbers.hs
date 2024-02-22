module Numbers where

-- | sortBySum 
--
-- Given a list of tuples of two Ints, 
-- sort the tuples by the sum of the two Ints, in ascending order.
-- If the input is empty, return an empty list.
-- 
-- Maintain the original order in the output 
-- if multiple tuples have the same sum values.
-- 
-- >>> sortBySum [(3,-1), (5,4), (-3,2)]
-- [(-3,2),(3,-1),(5,4)]
--
-- >>> sortBySum [(-4,100), (-4,43), (0,5), (-5,-3), (30,9)]
-- [(-5,-3),(0,5),(-4,43),(30,9),(-4,100)]
--
sortBySum :: [(Int,Int)] -> [(Int,Int)]
sortBySum = undefined

-- | addUp
--
-- Given a postive Int as input,
-- return the sum of even digits of the Int.
-- 
-- Examples:
--
-- >>> addUp 123
-- 2
-- 
-- >>> addUp 100000
-- 0
--  
addUp :: Int -> Int
addUp = undefined 

-- | multipleInBetween
--
-- Given a tuple of two Ints and an Int as input,
-- return the list of Ints that are between the two Ints in the tuple,
-- and are multiples of the second input.
-- The output list should be in ascending order.
-- If there is no such Int, return an empty list.
--
-- >>> multipleInBetween (5,1) 3
-- [3]
--
-- >>> multipleInBetween (-5,2) 1
-- [-4,-3,-2,-1,0,1]
--
multipleInBetween :: (Int,Int) -> Int -> [Int] 
multipleInBetween = undefined
