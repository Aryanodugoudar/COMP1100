module Drop where

-- Look at the following function. DO NOT EDIT IT.

dropOverlap :: Eq a => [a] -> [a] -> [a]
dropOverlap [] _ = []
dropOverlap (l:list1) list2
  |elem l list2 = dropOverlap list1 list2
  |otherwise = l:dropOverlap list1 list2

-- | myDropOverlap
--
-- Write a function that is functionally identical 
-- (always returns the same result as dropOverlap) to dropOverlap, 
-- but uses either foldr or foldl rather than explicit recursion. 
--
-- If you do not use foldr or foldl in this way,
-- you will recieve ZERO MARKS.
--
-- Examples:
--
-- >>> myDropOverlap "" "1234"
-- ""
--
-- >>> myDropOverlap [1,2,3,4] [1,4]
-- [2,3]
--
myDropOverlap :: Eq a => [a] -> [a] -> [a] 
myDropOverlap = undefined 


