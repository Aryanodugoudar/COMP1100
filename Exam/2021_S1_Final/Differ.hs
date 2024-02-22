module Differ where

-- | listDiff
--
-- Given two lists of Ints as input, return a list of the element-wise
-- differences between the two lists.  Elements of the second list
-- should be subtracted from the first list.  If one of the lists is
-- shorter than the other, append the remaining elements to the output
-- list.
--
-- Examples:
--
-- >>> listDiff [1,1,1,1,1] [1,1,1]
-- [0,0,0,1,1]
--
-- >>> listDiff [3,5,7] [8,4,2,-1,-5]
-- [-5,1,5,-1,-5]
--
-- >>> listDiff [] []
-- []
--
-- >>> listDiff [5,6,7,-2,-3] [-5]
-- [10,6,7,-2,-3]

listDiff :: [Int] -> [Int] -> [Int]
listDiff xs ys
  | null xs && null ys = []
  | null ys = xs
  | null xs = ys
  | otherwise = (head xs - head ys) : listDiff (tail xs) (tail ys)


 
-- | isDiffer
--
-- Given a positive Int and a list of Ints as input, return the pair
-- of two elements where the absolute difference is equal to the input
-- Int.  When multiple such pairs exist, only return the pair whose
-- first element occurs first.  Return Nothing if the pair is not
-- found, or if the input list contains less than two elements, or if
-- the input is negative.
--
-- Note that it is NOT necessary to complete the previous question
-- before attempting this question.
--
-- Examples:
--
-- >>> isDiffer 4 [3]
-- Nothing
--
-- >>> isDiffer 0 [4,2,5,2,3,2,3]
-- Just (2,2)
--
-- >>> isDiffer 10 [4,3,6,3]
-- Nothing
--
-- >>> isDiffer 3 [2,6,9,5]
-- Just (2,5)

isDiffer :: Int -> [Int] -> Maybe (Int, Int)
isDiffer n xs
  | n < 0 || length xs < 2 = Nothing
  | otherwise = findPair xs
  where
    findPair [] = Nothing
    findPair (x:rest) = case findElement x rest of
      Just y -> Just (x, y)
      Nothing -> findPair rest

    findElement :: Int -> [Int] -> Maybe Int
    findElement _ [] = Nothing
    findElement x (y:ys)
      | x - y == n || y - x == n = Just y
      | otherwise = findElement x ys
 
isSort :: [Int] -> [Int]
isSort list = case list of
    []        -> []
    [x]       -> [x]
    (x:y:xs)
        | x > y     -> y : isSort (x:xs)
        | otherwise -> x : isSort (y:xs)



