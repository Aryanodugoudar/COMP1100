module Trees where

-- Binary tree definition. DO NOT EDIT THIS.
-- (Adding a 'deriving' statement is allowed, but not necessary)

data BinaryTree a = Null |
                    Node (BinaryTree a) a (BinaryTree a)

-- | sameValues
-- 
-- Given two Binary Trees as input, 
-- return True if the two trees contain the same values in any order. 
-- Return False, otherwise.
--
-- You may find it useful to use your code from the labs.
--
-- Examples: 
--
-- >>> sameValues (Node (Node Null 1 Null) 2 (Node Null 3 Null)) (Node Null 1 (Node Null 2 (Node Null 3 Null))) 
-- True
-- 
-- >>> sameValues (Node Null 4 (Node Null 3 Null)) (Node Null 3 (Node Null 5 Null))
-- False
--
sameValues :: Eq a => BinaryTree a -> BinaryTree a -> Bool
sameValues = undefined

-- | showPathTo
--
-- Given a Binary Tree and an Int as input,
-- return a list of all the elements along the path
-- from the root node to the Int being looked for.
-- 
-- You can assume that elements in the tree are unique.
-- 
-- If the tree is empty or the Int does not exist in the tree, 
-- return an empty list.
-- 
-- Examples:
--
-- >>> showPathTo (Node Null 1 (Node Null 2 (Node Null 3 Null))) 3
-- [1,2,3]
--
-- >>> showPathTo (Node (Node Null 7 (Node Null 4 Null)) 1 (Node Null 2 (Node Null 3 Null))) 7
-- [1,7]
--
showPathTo :: BinaryTree Int -> Int -> [Int]
showPathTo = undefined

