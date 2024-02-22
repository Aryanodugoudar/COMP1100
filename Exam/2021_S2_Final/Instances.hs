module Instances where

-- IntList definition. DO NOT EDIT THIS.
-- (Adding 'deriving' statements is not allowed)

data IntList = Empty | Cons Int IntList

-- | show
--
-- Make IntList an instance of Show,
-- by defining the show function that shows
-- each Int value in the list surrounded by vertical bars,i.e., "|". 
-- No white spaces.
-- Return an empty string when the list is Empty.
--
-- Examples:
-- 
-- >>> show Empty
-- ""
-- 
-- >>> show (Cons 1 (Cons 2 (Cons 3 Empty)))
-- "|1||2||3|" 

instance Show IntList where
  show = undefined

-- IntTree definition. DO NOT EDIT THIS.
-- (Adding 'deriving' statements is not allowed)

data IntTree = Leaf Int | Node Int IntTree IntTree

-- | (==)
--
-- Make IntTree an instance of Eq,
-- by defining the (==) function that defines
-- if the two Int trees are equal. 
-- Two trees are defined to be equal if they share the same elements, 
-- with the same structure. 
--
-- Examples:
-- 
-- >>> (Leaf 0) == (Leaf 0)
-- True
-- 
-- >>> (Node 1 (Leaf 2) (Leaf 3)) == (Node 1 (Leaf 3) (Leaf 2))
-- False

instance Eq IntTree where 
  (==) = undefined
     

