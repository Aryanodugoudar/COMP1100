module SetsWithLists where

data Set a = Set [a]
   deriving Show


{-
Exercise 4

Complete the functions setEquals, addElement, setUnion.

We have given you the complexity class that your functions should meet.

-}


-- | Returns the definition for the empty set for this data structure
-- best O(1), worst O(1), average O(1)
emptySet :: Set a
emptySet = Set []


-- | The number of elements in a set.
-- best O(n), worst O(n), average O(n)
setSize :: Integral b => Set a -> b
setSize (Set list) = case list of
  []    -> 0
  _: xs -> 1 + setSize (Set xs)


-- | Checks if an element is present in a set
-- best O(1), worst O(n), average O(n)
containsElement :: (Eq a) => Set a -> a -> Bool
containsElement (Set list) element = elem element list


-- Mergesort implementation
merge :: (Ord a) => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y    = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

mergesort :: (Ord a) => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs =
    let (left, right) = splitAt (length xs `div` 2) xs
    in merge (mergesort left) (mergesort right)

-- | Equality on sets using mergesort
-- best O(n log n), worst O(n log n), average O(n log n)
setEquals :: (Eq a, Ord a) => Set a -> Set a -> Bool
setEquals (Set list1) (Set list2) = mergesort list1 == mergesort list2

-- | Computes the union of two sets using mergesort
-- best O(n log n), worst O(n log n), average O(n log n)
setUnion :: (Eq a, Ord a) => Set a -> Set a -> Set a
setUnion (Set list1) (Set list2) = Set (mergesort (merge list1 list2))



-- ==================================
--  Functions below are extensions
-- ==================================


-- | Removes an element from a set, if it is present
-- best O(?), worst O(?), average O(?)
removeElement :: (Eq a) => a -> Set a -> Set a --1130 
removeElement = undefined

-- | Computes the intersection of two sets (all the elements in both sets)
-- best O(?), worst O(?), average O(?)
setIntersection :: (Eq a) => Set a -> Set a -> Set a --1130
setIntersection = undefined
-- | Computes the set difference (all the elements in the first set, but not the second)
-- best O(?), worst O(?), average O(?)
setDifference :: (Eq a) => Set a -> Set a -> Set a --1130
setDifference = undefined
