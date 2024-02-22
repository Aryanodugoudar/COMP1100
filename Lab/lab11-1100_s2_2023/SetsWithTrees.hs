module SetsWithTrees where

import BinaryTree

data Set a = Set (BSTree a)
   deriving Show

{-
Exercise 6

Complete all these functions, and state their complexity class.

COMP1100:   setEquals, 
            addElement, 
            setUnion

Extensions: setEquals, 
            addElement, 
            setUnion, 
            removeElement, 
            setIntersection, 
            setDifference
-}


-- | Returns the definition for the empty set for this data structure
-- Balanced tree: best O(1), worst O(1)
emptySet :: Set a
emptySet = Set Null

-- | The number of elements in a set.
-- Balanced tree: best O(1), worst O(n)
setSize :: Integral b => Set a -> b
setSize (Set tree) = treeSize tree

-- | Checks if an element is present in a set
-- Balanced tree: best O(log n), worst O(n)
containsElement :: (Ord a) => Set a -> a -> Bool
containsElement (Set tree) = elemBSTree tree

-- | Equality on sets
-- Balanced tree: best O(n), worst O(n log n)
setEquals :: (Ord a) => Set a -> Set a -> Bool
setEquals (Set tree1) (Set tree2) = flattenTreeOrd tree1 == flattenTreeOrd tree2

-- | Adds an element to a set, if it does not already exist
-- Balanced tree: best O(log n), worst O(n)
addElement :: (Ord a) => a -> Set a -> Set a
addElement x (Set tree) = Set (treeInsert tree x)

-- | Computes the union of two sets
-- Balanced tree: best O(n), worst O(n log n)
setUnion :: (Ord a) => Set a -> Set a -> Set a
setUnion (Set tree1) (Set tree2) = Set (mergeTrees tree1 tree2)

-- Helper function to merge two trees
mergeTrees :: (Ord a) => BSTree a -> BSTree a -> BSTree a
mergeTrees tree1 tree2 = foldr treeInsert tree1 (flattenTreeOrd tree2)
