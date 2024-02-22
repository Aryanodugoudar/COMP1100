module Trees where

-- Binary tree definition. DO NOT EDIT THIS.
-- (Adding a 'deriving' statement is allowed, but not necessary)

data BinaryTree a = Null |
                    Node (BinaryTree a) a (BinaryTree a)

-- | countFull
--
-- Call a node in a Binary Tree 'full' if it has two childen that are
-- not Null.
--
-- Given as input a Binary Tree, return the number of full nodes.
--
-- Examples:
--
-- >>> countFull Null
-- 0
--
-- >>> countFull (Node (Node (Node Null 4 Null) 2 Null) 1 (Node (Node Null 5 Null) 3 (Node Null 6 Null)))
-- 2

countFull :: BinaryTree a -> Int
countFull = undefined -- TODO

-- | sumAtDepth
--
-- Given an Int d and a Binary Tree as input, return the sum of the
-- values at depth d.
--
-- Recall that the root of the tree has depth 0, its children have
-- depth 1, and so on.
--
-- If there are no nodes at depth d, return 0.
--
-- Examples:
--
-- >>> sumAtDepth (-2) (Node (Node (Node Null 4 Null) 2 Null) 1 (Node (Node Null 5 Null) 3 (Node Null 6 Null)))
-- 0
--
-- >>> sumAtDepth 1 (Node (Node (Node Null 4 Null) 2 Null) 1 (Node (Node Null 5 Null) 3 (Node Null 6 Null)))
-- 5
--
-- >>> sumAtDepth 4 (Node (Node (Node Null 4 Null) 2 Null) 1 (Node (Node Null 5 Null) 3 (Node Null 6 Null)))
-- 0

sumAtDepth :: Int -> BinaryTree Int -> Int
sumAtDepth = undefined -- TODO

-- Rose tree definition. DO NOT EDIT THIS.
-- (Adding a 'deriving' statement is allowed, but not necessary)

data Rose a = Rose a [Rose a]

-- | suffix
--
-- A Rose Tree r is a 'suffix' of another Rose Tree s if r appears in
-- s as a complete tree.
--
-- In other words:
-- - the value at the root of r appears somewhere in s,
-- - the children of the root of r exactly match the children of that
--   node of s,
-- - and so on down to the leaves, which are leaves in both r and s.
--
-- Given two Rose Trees as input, return True if the first Rose Tree
-- is a suffix of the second, and False otherwise.
--
-- Examples:
--
-- >>> suffix (Rose 2 []) (Rose 1 [Rose 2 [Rose 4 [],Rose 5 []],Rose 3 []])
-- False
--
-- >>> suffix (Rose 2 [Rose 4 []]) (Rose 1 [Rose 2 [Rose 4 [],Rose 5 []],Rose 3 []])
-- False
--
-- >>> suffix (Rose 2 [Rose 4 [],Rose 5 []]) (Rose 1 [Rose 2 [Rose 4 [],Rose 5 []],Rose 3 []])
-- True

suffix :: Eq a => Rose a -> Rose a -> Bool
suffix = undefined -- TODO
