module CutSubTree where

-- Do not edit code between the lines.
-- ***************************************************************************
data BTree a = Null | Node (BTree a) a (BTree a)
  deriving Show
-- ***************************************************************************

-- Write an Eq typeclass instance for 'BTree a'. 
-- Two Binary Trees are equal if their left subtrees are equal,
-- their right subtrees are equal, and their node values are equal.
--
-- Write the Eq instance between these lines
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- Given the above definition of a binary tree, and the instantiation of the
-- 'Eq' typeclass, write a function 'cut' that takes an input binary tree
-- and a secondary binary tree and tries to remove the second from the first.
--
-- pictorially:
--              'h'                                'h'
--             /   \                               /
--   cut      'e'  'l'           'l'      =      'e'
--                /   \         /   \
--               'l'  'o'      'l'  'o'
--  
-- If the second binary tree does not exist inside the first tree, return
-- Nothing. 
-- If both trees are empty return Nothing.
-- If more than one sub-tree matches, cut the first subtree seen.
-- Look at left subtrees before right subtrees.

-- | Cutting subtrees from binary trees.
--
-- >>> :{
-- cut (Node (Node Null 'e' Null) 'h' 
--       (Node (Node Null 'l' Null) 'l' (Node Null 'o' Null)))
--     (Node (Node Null 'l' Null) 'l' (Node Null 'o' Null)) 
-- :}
-- Just (Node (Node Null 'e' Null) 'h' Null)
--
-- >>> cut Null Null
-- Nothing
--
-- >>> :{
-- cut (Node (Node Null 'e' Null) 'h' 
--       (Node (Node Null 'l' Null) 'l' (Node Null 'o' Null)))
--      (Node Null 'k' Null)
-- :}
-- Nothing
--
-- >>> :{
-- cut (Node (Node Null 2 Null) 1 (Node Null 3 Null))
--     (Node (Node Null 2 Null) 1 (Node Null 3 Null))
-- :}
-- Just Null
--
-- >>> :{
-- cut (Node (Node Null 2 Null) 1 (Node Null 3 Null))
--     (Node Null 2 Null)
-- :}
-- Just (Node Null 1 (Node Null 3 Null))

cut :: (Eq a) => BTree a -> BTree a -> Maybe (BTree a)
cut = undefined

             
      
