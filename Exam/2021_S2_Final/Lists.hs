module Lists where

-- | eqTuples
--
-- Given a list of tuples,
-- return a list of Bools where it is True when the tuple 
-- contains the same values, and False when it doesn't.
-- The size of the output list should be the same as the size of the input list.
--
-- Examples:
--
-- >>> eqTuples [(1,1),(2,2),(3,4)]
-- [True,True,False]
--
-- >>> eqTuples [('a','b'),('c','d'),('e','f')]
-- [False,False,False]
--
eqTuples :: Eq a => [(a,a)] -> [Bool]
eqTuples = undefined

-- | findNjump
--
-- Given a value and two lists as input,
-- use the index of the first appearance of the value in the first list
-- to remove all the elements before the index from the second list.
-- If the value does not appear in the first list,
-- return the second list as is.
--
-- Examples:
--
-- >>> findNjump 1 [1,2,3] "abc"
-- "abc"
--
-- >>> findNjump 2 [1,2,3] "abc"
-- "bc"
--
-- findNjump 'a' "can" [9.3, 4.1, 6.7, 5.63]
-- [4.1,6.7,5.63]
--
-- >>> findNjump 'a' "bcd" [1,2,3]
-- [1,2,3]
--
findNjump :: Eq a => a -> [a] -> [b] -> [b]
findNjump = undefined

-- | shortAndLong 
-- 
-- Given a list of Strings as input,
-- return the shortest and the longest String in the list as a tuple.
-- When there are Strings with the same length, 
-- return the String that appears first.
-- If the input list is empty, raise an error message.
--
-- Examples:
--
-- >>> shortAndLong ["wassup"]
-- ("wassup","wassup")
-- 
-- >>> shortAndLong ["This", "That"]
-- ("This","This")
--
-- >>> shortAndLong ["This", "sentence", "is", "ridiculous"]
-- ("is","ridiculous")
--
shortAndLong :: [String] -> (String, String)
shortAndLong = undefined
