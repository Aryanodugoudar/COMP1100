module Lab10 where

import DrawTree
-- Week 10 Type Classes 
-- David Quarel 16/02/2019

{- 
Exercise 1: (Optional)

Work out the type classes for the folowing types.
The first has been done for you.


Integer                 (Integral)
Double                  (?)
Char                    (?)
Bool                    (?)
(Integer, Integer)      (?)
(Integer, Double)       (?)
String                  (?)
[Integer]               (?)
Integer -> Integer      (?)
Maybe Integer           (?)
-}



{-
Exercise 2:

What are the types of these functions?
(Don't just cheat and punch it in GHCi. Try to work it out yourself.)
-}

cow :: Eq a => Bool -> a -> [a] -> Bool
cow x y z = x && (elem y z)


foo :: Eq a => a -> [a] -> [[a]] -> Bool
foo x y z = (elem x y) && (elem y z)

bar :: Num a => a -> Maybe a -> a
bar x y = case y of
    Nothing -> x
    Just z  -> x + z


snap :: (Show a, Ord a) => a -> a -> String
snap x y
    |x > y = show x
    |otherwise = show y

{-
Exercise 3A, 3B: Defining equality and ordering on Nat

Using the template given, define all the functions required for
`Nat` to be a member of `Eq` and `Ord`.

DO NOT USE "deriving Eq" or "deriving Ord". 
You should define the instances of (==) and (<=) yourself.
-}

data Nat = Z | S Nat
    deriving (Show)

instance Eq Nat where
    (==) Z Z = True
    (==) (S n) (S m) = n==m
    (==) _ _ = False 

instance Ord Nat where
    (<=) Z _ = True
    (<=) (S _) Z = False
    --(<=) Z (S _) = True
    --(<=) (S n) (S m) = n==m
    (<=) (S n) (S m) = m>=n

-- ======= BINARY SEARCH TREES =========

--data BinaryTree a = Null | Node (BinaryTree a) a (BinaryTree a)
--    deriving Show

type BSTree a = BinaryTree a

-- A graphical representation of 'notBSTree'
--
--        5
--      /   \
--     3     7
--    / \   / \
--   1   2 6   9 
--
-- Question: Why isn't this a binary search tree?

notBSTree :: BinaryTree Integer
notBSTree = Node (Node (Node Null 1 Null) 3 (Node Null 2 Null))
                    5
                 (Node (Node Null 6 Null) 7 (Node Null 9 Null))

-- A graphical representation of 'goodTree'                 
--
--                           15
--                          /  \
--                         /    \
--                        /      \ 
--                       /        \
--                      /          \
--                     7           23        
--                    / \         /  \
--                   /   \       /    \
--                  3    12     17    26  
--                 / \   / \   /  \   / \
--                1   5 10 13 16  18 25 31     
--
--  Question: Why is this a valid binary search tree?

goodTree :: BSTree Integer
goodTree =  Node 
                (Node
                    (Node 
                        (Node 
                                Null 
                            1 
                                Null) 
                    3 
                        (Node 
                                Null 
                            5 
                                Null))
                7
                    (Node   
                        (Node 
                                Null 
                            10 
                                Null) 
                    12 
                        (Node 
                                Null 
                            13 
                                Null)))
            15

                (Node 
                    (Node
                        (Node 
                                Null 
                            16 
                                Null) 
                    17 
                        (Node 
                                Null 
                            18 
                                Null))
                23
                    (Node
                        (Node 
                                Null 
                            25 
                                Null) 
                    26 
                        (Node 
                                Null 
                            31 
                                Null)))

-- A graphical representation of 'unbalancedTree':
--
--                        3
--                       / \
--                      1   7 
--                         / \
--                        5  12
--                          /  \
--                         10  15
--                            /  \
--                           13  17
--                              /  \ 
--                             16  23
--                                /  \
--                               18  26
--                                  /  \
--                                 25  31 
--
--  Question: Why is this tree unbalanced?

unbalancedTree :: BSTree Integer
unbalancedTree = Node (Node Null 1 Null) 3
            (Node (Node Null 5 Null) 7
                (Node (Node Null 10 Null) 12
                    (Node (Node Null 13 Null) 15
                        (Node (Node Null 16 Null) 17
                            (Node (Node Null 18 Null) 23
                                (Node (Node Null 25 Null) 26
                                        (Node Null 31 Null)))))))


-- A graphical representation of 'smallTree':
--
--                   5
--                  / \
--                 1  10

smallTree :: BSTree Integer
smallTree = Node (Node Null 1 Null) 5 (Node Null 10 Null)

{-
Exercise 4: elemBSTree

Rewrite the `elemTree` function from Lab 9 before, but this time you may assume
that the input tree satisfies the binary search ordering constraint. Do
not use the same function as before, you should be able to search more
efficiently, as we did in the example above.

-}


elemBSTree :: (Ord a) => a -> (BSTree a) -> Bool
elemBSTree _ Null = False           
elemBSTree x (Node left value right)
    | x < value = elemBSTree x left  
    | x > value = elemBSTree x right 
    | otherwise = True               


{-
Exercise 5: treeBSMax

Rewrite the `treeMaximum` and `treeMinimum` functions, again assuming
the input tree is a binary search tree. Be efficient!
-}


treeBSMax :: (Ord a) => BSTree a -> a
treeBSMax tree = case tree of
    Node _ value Null -> value
    Node _ _ right -> treeBSMax right
    Null -> error "Empty tree has no maximum value"

treeBSMin :: (Ord a) => BSTree a -> a
treeBSMin tree = case tree of
    Node Null value _ -> value
    Node left _ _ -> treeBSMin left
    Null -> error "Empty tree has no minimum value"


{-
Exercise 6: isBSTree

Write a function 
that takes a `BinaryTree Integer` as input, and checks if the
binary search constraint holds.
-}

isBSTree :: (Ord a) => BinaryTree a -> Bool
isBSTree tree = isBSTree' tree Nothing Nothing
    where
        isBSTree' Null _ _ = True -- An empty tree is a BST
        isBSTree' (Node left value right) minBound maxBound =
            let leftIsBST = isBSTree' left minBound (Just value)
                rightIsBST = isBSTree' right (Just value) maxBound
            in case (minBound, maxBound) of
                (Nothing, Nothing) -> leftIsBST && rightIsBST
                (Nothing, Just maxV) -> leftIsBST && (value < maxV) && rightIsBST
                (Just minV, Nothing) -> (minV < value) && leftIsBST && rightIsBST
                (Just minV, Just maxV) -> (minV < value) && (value < maxV) && leftIsBST && rightIsBST


{-
Exercise 7: treeInsert

Write a function that takes a binary search tree, and an element, and inserts
that element into the tree, ensuring the binary search property still holds.
(If the element is already in the tree, leave the tree unchanged.)
-}


treeInsert :: (Ord a) => BSTree a -> a -> BSTree a
treeInsert Null x = Node Null x Null  -- If the tree is empty, create a new node with the element
treeInsert (Node left value right) x
    | x < value = Node (treeInsert left x) value right  -- If x is less than the current node value, insert in the left subtree
    | x > value = Node left value (treeInsert right x)  -- If x is greater than the current node value, insert in the right subtree
    | otherwise = Node left value right  -- If x is equal to the current node value, leave the tree unchanged


{-      
Exercise 8: flattenTreeOrd

Write a function
that flattens a binary search tree, but preserves the ordering.
(That is, when a binary search tree is flattened, the resulting list
should be sorted.)
-}


flattenTreeOrd :: BinaryTree a -> [a]
flattenTreeOrd Null = []  
flattenTreeOrd (Node left value right) = flattenTreeOrd left ++ [value] ++ flattenTreeOrd right



-- =========== EXTENSIONS =============

{-
Extension 1

Write a function
that takes a binary search tree, and an element, and removes it from the tree
(if it is present).
-}

treeDelete :: (Ord a) => (BSTree a) -> a -> (BSTree a)
treeDelete = undefined
            
{-
Extension 2 (Tricky, Optional for everyone)

Write a function
that takes a binary search tree of integers, and rearranges the structure
of the tree so it is now balanced.
You may have to do some research as to how to implement this.
(Really Tricky: Do it without flattening the entire tree and rebuilding it
from scratch.)
-}

treeBalance :: (Ord a) => BSTree a -> BSTree a
treeBalance = undefined

{-
Extension 3

Define each of the functions necessary for the Nat type (defined above) 
such that it can be part of the Num typeclass.
-}

instance Num Nat where
    (+) = undefined
    (-) = undefined
    (*) = undefined
    abs = undefined
    signum = undefined
    fromInteger = undefined

{-
Extension 4

We  define two trees to be equal if they share 
the same elements, with the same ordering once flattened.
Add an instance of equality for binary trees that satisfies this condition.
-}

instance (Eq a) => Eq (BinaryTree a) where
    (==) = undefined
