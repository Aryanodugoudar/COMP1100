module BinaryTree where

type BSTree a = BinaryTree a

data BinaryTree a = Null | Node (BinaryTree a) a (BinaryTree a)
    deriving Show


{-
Exercise 5

Copy in your solutions from Lab 09 and Lab 10
(or finish them off if you haven't)

State the complexity class of each function.
They should be written as efficently as possible.
-}

-- Copy in your solutions from Lab 09
-- Check the type signature of the original function implementation
-- against the type signature in the current file.

-- Balanced tree: best O(n), worst O(n)
-- Any tree:      best O(n), worst O(n)
treeSize :: BinaryTree a -> Int
treeSize bt = case bt of
    Null->0
    Node(left) _ (right) -> 1 + treeSize left + treeSize right

-- Balanced tree: best O(log n), worst O(n)
-- Any tree:      best O(n), worst O(n)
treeDepth :: BinaryTree a -> Int
treeDepth bt = case bt of
    Null-> 0
    Node(left) _ (right) -> 1 + max(treeDepth left) (treeDepth right)

-- Balanced tree: best O(n), worst O(n log n)
-- Any tree:      best O(n), worst O(n log n)
flattenTree :: BinaryTree a -> [a]
flattenTree bt =case  bt of
    Null->[]
    (Node left x right) -> flattenTree left ++ [x] ++ flattenTree right


-- Balanced tree: best O(n), worst O(n)
-- Any tree:      best O(n), worst O(n)
leavesTree :: BinaryTree a -> [a]
leavesTree bt = case bt of
    Null->[]
    Node(Null) x (Null)-> [x]
    Node(left) _ (right)-> leavesTree left ++ leavesTree right

-- Balanced Tree: Best O(n), Worst O(n)
-- Any Tree: Best O(n), Worst O(n)
treeMap :: (a -> b) -> (BinaryTree a) -> (BinaryTree b)
treeMap _ Null = Null
treeMap f (Node left x right) = Node (treeMap f left) (f x) (treeMap f right)


-- Copy in your solutions from Lab 10
-- You may need to edit the order of inputs compared to the 
-- original implementation in Lab 10

-- Balanced tree: best O(log n), worst O(n)
-- Any tree:      best O(n), worst O(n)
elemBSTree :: (Ord a) => a -> (BSTree a) -> Bool
elemBSTree _ Null = False           
elemBSTree x (Node left value right)
    | x < value = elemBSTree x left  
    | x > value = elemBSTree x right 
    | otherwise = True 

-- Balanced Tree: Best O(log n), Worst O(n)
-- Any Tree: Best O(log n), Worst O(n)
treeBSMax :: (Ord a) => BSTree a -> a
treeBSMax tree = case tree of
    Node _ value Null -> value
    Node _ _ right -> treeBSMax right
    Null -> error "Empty tree has no maximum value"

-- Balanced Tree: Best O(log n), Worst O(n)
-- Any Tree: Best O(log n), Worst O(n)
treeBSMin :: (Ord a) => BSTree a -> a
treeBSMin tree = case tree of
    Node Null value _ -> value
    Node left _ _ -> treeBSMin left
    Null -> error "Empty tree has no minimum value"

-- Balanced Tree: Best O(n), Worst O(n)
-- Any Tree: Best O(n), Worst O(n)
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


-- Balanced Tree: Best O(log n), Worst O(n)
-- Any Tree: Best O(log n), Worst O(n)
treeInsert :: (Ord a) => BSTree a -> a -> BSTree a
treeInsert Null x = Node Null x Null  -- If the tree is empty, create a new node with the element
treeInsert (Node left value right) x
    | x < value = Node (treeInsert left x) value right  -- If x is less than the current node value, insert in the left subtree
    | x > value = Node left value (treeInsert right x)  -- If x is greater than the current node value, insert in the right subtree
    | otherwise = Node left value right  -- If x is equal to the current node value, leave the tree unchanged


-- Balanced Tree: Best O(n), Worst O(n log n)
-- Any Tree: Best O(n), Worst O(n log n
flattenTreeOrd :: BinaryTree a -> [a]
flattenTreeOrd Null = []  
flattenTreeOrd (Node left value right) = flattenTreeOrd left ++ [value] ++ flattenTreeOrd right


-- =================================
-- Functions below are extensions
-- =================================

-- Balanced tree: best O(?), worst O(?)
-- Any tree:      best O(?), worst O(?)
treeDelete :: (Ord a) => (BSTree a) -> a -> (BSTree a)
treeDelete = undefined

-- This was an optional exercise, so if you haven't implemented treeBalance, 
-- don't worry about it.
-- Balanced tree: best O(?), worst O(?)
-- Any tree:      best O(?), worst O(?)
treeBalance :: (Ord a) => BSTree a -> BSTree a
treeBalance = undefined


{-
Module for drawing nice looking trees
David Quarel 13/02/2019

Don't worry too much about how this works,
or the types of these functions.
It's beyond the scope of this course.

Code modified from
http://hackage.haskell.org/package/containers-0.5.7.1/docs/src/Data.Tree.html#drawTree
-}

printTree :: (Show a) => BinaryTree a -> IO ()
printTree = putStr.unlines.draw

draw :: (Show a) => BinaryTree a -> [String]
draw Null = ["Null"]
draw (Node left x right) = (show x) : drawSubTrees [right,left]
  where
    drawSubTrees [] = []
    drawSubTrees [t] =
        "|" : shift "`- " "   " (draw t)
    drawSubTrees (t:ts) =
        "|" : shift "+- " "|  " (draw t) ++ drawSubTrees ts

    shift first other = zipWith (++) (first : repeat other)


notBSTree :: BinaryTree Integer
notBSTree = Node (Node (Node Null 1 Null) 3 (Node Null 2 Null))
                    5
                 (Node (Node Null 6 Null) 7 (Node Null 9 Null))

-- I've tried my best to textually display the tree in a nice way
-- Sorry if it's more confusing now

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

badTree :: BSTree Integer
badTree = Node (Node Null 1 Null) 3
            (Node (Node Null 5 Null) 7
                (Node (Node Null 10 Null) 12
                    (Node (Node Null 13 Null) 15
                        (Node (Node Null 16 Null) 17
                            (Node (Node Null 18 Null) 23
                                (Node (Node Null 25 Null) 26
                                        (Node Null 31 Null)))))))

smallTree :: BSTree Integer
smallTree = Node (Node Null 1 Null) 5 (Node Null 10 Null)
