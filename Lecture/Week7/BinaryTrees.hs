module BinaryTrees where

data CustomList a = Empty | Cons a (CustomList a)
  deriving Show

testList :: CustomList Int
testList = Cons 1 (Cons 2 (Cons 3 Empty))

myMap :: (a -> b) -> CustomList a -> CustomList b
myMap f list = case list of
  Empty     -> Empty
  Cons x xs -> Cons (f x) (myMap f xs)

data BinaryTree a = Null
                  | Node (BinaryTree a) a (BinaryTree a)

testTree :: BinaryTree Int
testTree = Node (Node Null 8 Null) 5 Null

sumTree :: BinaryTree Int -> Int
sumTree tree = case tree of
  Null              -> 0
  Node left x right -> sumTree left + x + sumTree right