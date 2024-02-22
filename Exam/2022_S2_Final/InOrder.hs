module InOrder where

-- Do not edit anything between the lines
-- ***************************************************************************
data Rose a = MkRose a [Rose a]

-- The inorder tree traversal visits the left subtree, then the root
-- then the right subtree. Write a flattening function 'inorder' that
-- flattens a rose tree into a list inorder.

--  For example, the following depiction of the tree: 
--
--      'l'
--     /   \
--   'e'   'o'
--   / \      
-- 'h' 'l'   
--  
--  Should flatten into "hello" using an inorder traversal.

-- The function 'join' joins a list of lists into a single list.
join :: [[a]] -> [a]
join [] = []
join (xs : xss) = xs ++ join xss

-- the function 'joinMap' just maps a function over a list 
-- (inside a list of lists) first, then joins it together with 'join'.
joinMap :: (a -> [b]) -> [a] -> [b]
joinMap f = join . (map f)

-- hint: the abvove functions may be very useful for working with rose trees.
-- ***************************************************************************

-- An example rose tree for testing.
ex :: Rose Char
ex = (MkRose 'l' [MkRose 'e' [MkRose 'h' [], MkRose 'l'[]], MkRose 'o' []])

-- The symbols :{ and }: let us use multi-line statements in DocTest.

-- | Inorder flatten of a rose tree.
-- >>> :{
--   inorder (MkRose 'l' [MkRose 'e' [MkRose 'h' [], MkRose 'l'[]], MkRose 'o' []])
-- :}
-- "hello"
--
-- >>> :{
--   inorder (MkRose 'l' [MkRose 'e' [MkRose 'h' []], MkRose 'o' [MkRose 'l' []]])
-- :}
-- "hello"
--
-- >>> inorder (MkRose 3 [MkRose 2 [MkRose 1 []], MkRose 5 [MkRose 4 []]])
-- [1,2,3,4,5]  
--
-- >>> inorder (MkRose 3 [])
-- [3]

-- | Inorder flatten of a rose tree.
inorder :: Rose a -> [a]
inorder (MkRose value children) = joinMap inorder children ++ [value]

