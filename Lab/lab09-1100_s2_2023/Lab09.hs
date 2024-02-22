module Lab09 where
    
import Data.Char
import DrawTree
-- Week 9 Trees
-- David Quarel 12/02/2019

-- data BinaryTree a = Null | Node (BinaryTree a) a (BinaryTree a)
--    deriving Show

tree1 :: BinaryTree Integer
tree1 = Node (Node (Node Null 2 (Node Null 11 Null)) 4 (Node (Node Null 0 Null) 
    1 (Node Null (-3) Null))) 5 (Node (Node (Node Null (-4) Null) 8 
    (Node Null 7 Null)) 3 Null)

{-
Exercise 1: treeSize

Counts the number of elements in a tree
-}

treeSize :: BinaryTree a -> Int
treeSize bt = case bt of
    Null->0
    Node(left) _ (right) -> 1 + treeSize left + treeSize right



{-
Exercise 2: treeDepth

Write a function that computes the depth of a tree, which is defined as
the length of the longest path from the root node down to any leaf.
-}

treeDepth :: BinaryTree a -> Int
treeDepth bt = case bt of
    Null-> 0
    Node(left) _ (right) -> 1 + max(treeDepth left) (treeDepth right)



{-
Exercise 3: leavesTree

Write a function that takes a tree, and returns a list containing
only the elements in leaf nodes.
-}

leavesTree :: BinaryTree a -> [a]
leavesTree bt = case bt of
    Null->[]
    Node(Null) x (Null)-> [x]
    Node(left) _ (right)-> leavesTree left ++ leavesTree right


{-
Exercise 4: treeMap

Write a function that works analogously to `map`, by applying a function
to each node in a tree.
-}

treeMap :: (a -> b) -> (BinaryTree a) -> (BinaryTree b)
treeMap _ Null = Null
treeMap f (Node left x right) = Node (treeMap f left) (f x) (treeMap f right)

{-
Exercise 5: elemTree

Write a function that takes an `Integer`, and checks if it is
present inside a tree of `Integer`'s.
-}

elemTree :: Int -> (BinaryTree Int) -> Bool
elemTree _ Null = False  
elemTree target (Node left x right)
    | x == target = True  
    | otherwise = elemTree target left || elemTree target right 


{- 
Exercise 6: treeMaximum

Write two functions, to find the minimum and maximum element in a tree
of type `Integer`.
-}

treeMaximum :: BinaryTree Integer -> Integer
treeMaximum bt = case bt of
    Null-> error "Empty Tree"
    (Node Null x Null) -> x
    (Node left x Null)-> max x (treeMaximum left)
    (Node Null x right) -> max x (treeMaximum right)
    (Node left x right)-> max x(max(treeMaximum left)(treeMaximum right))


treeMinimum :: BinaryTree Integer -> Integer
treeMinimum bt = case bt of
    Null-> error "Empty Tree"
    (Node Null x Null) -> x
    (Node left x Null)-> min x (treeMinimum left)
    (Node Null x right) -> min x (treeMinimum right)
    (Node left x right)-> min x(min(treeMinimum left)(treeMinimum right)) 

{-
Exercise 7: flattentree

Write a function that takes a tree, and returns a list containing
all the elements from that tree. We call such an operation **flattening**
a tree.
-}

flattenTree :: BinaryTree a -> [a]
flattenTree bt =case  bt of
    Null->[]
    (Node left x right) -> flattenTree left ++ [x] ++ flattenTree right

-- =========== ROSE TREES ============

data RoseTree a = RoseNode a [RoseTree a]
    deriving Show
things :: RoseTree String
things = 
    RoseNode "thing" [
        RoseNode "animal" [
            RoseNode "cat" [], RoseNode "dog" []
        ],
        
        RoseNode "metal" [
            RoseNode "alloy" [
                RoseNode "steel" [], RoseNode "bronze" []
            ],
            RoseNode "element" [
                RoseNode "gold" [], RoseNode "tin" [], RoseNode "iron" []
            ]
        ],
        
        RoseNode "fruit" [
            RoseNode "apple" [
                RoseNode "Granny Smith" [], RoseNode "Pink Lady" []
            ],
            RoseNode "banana" [],
            RoseNode "orange" []
        ],

        RoseNode "astronomical object" [
            RoseNode "Planet" [
                RoseNode "Earth" [], RoseNode "Mars" []
            ],
            RoseNode "Star" [
                RoseNode "The Sun" [], RoseNode "Sirius" []
            ],
            RoseNode "Galaxy" [
                RoseNode "Milky Way" []
            ]
        ]
    ] 

{-
Exercise 8: roseSize

Write a function
that counts the number of elements in a rosetree.
-}

roseSize :: RoseTree a -> Int
roseSize (RoseNode _ children) = 1 + sum (map roseSize children)

{-
Exercise 9: roseLeaves

Write a function
that returns a list of all leaves of the rosetree.
-}

roseLeaves :: RoseTree a -> [a]
roseLeaves rt = case rt of
    (RoseNode x []) -> [x]
    (RoseNode _ children) -> concatMap roseLeaves children


{-
Exercise 10: roseFlatten

Write a function
that returns a list of all elements in the rosetree.
-}

roseFlatten :: RoseTree a -> [a]
roseFlatten rt = case rt of
    (RoseNode x []) -> [x]
    (RoseNode x children) -> concatMap roseFlatten children ++ [x]



-- Turns strings into all upper case
allCaps :: String -> String
allCaps x = map toUpper x

{-
Exercise 11: roseMap

Write a function
that takes a function, and applies it to every element of a rosetree.
Test the result by mapping the function `allCaps` to the rosetree `things`.
All the elements should now be written in uppercase.
-}


roseMap :: (a -> b) -> RoseTree a -> RoseTree b
roseMap f (RoseNode x children)= RoseNode (f x) (map (roseMap f) children)


{-
Exercise 12: binaryTreeToRose

Write a function
that converts a binary tree to a rosetree. The new rosetree should
have the same structure as the binary tree.
-}

binaryTreeToRose :: BinaryTree a -> RoseTree a
binaryTreeToRose bt= case bt of
    (Node Null x Null) -> RoseNode x []
    (Node left x right) -> RoseNode x [binaryTreeToRose left, binaryTreeToRose right]

-- =========== EXTENSIONS =============

{-

Extension 1

Write a function 
that verifies if a tree is **balanced**, that is, there is no other way to
restructure the tree such that it has smaller depth.
-}


isBalanced :: BinaryTree a -> Bool
isBalanced = undefined
