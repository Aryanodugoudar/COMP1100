module BoxTesting where

import Data.List (nub, sort)


-- | Second Mininmum.
-- 
-- >>> secondMinimum []
-- Nothing
--
-- >>> secondMinimum [1,1,1]
-- Nothing
--
-- >>> secondMinimum [1,2,1,3,4]
-- Just 2
--
-- >>> secondMinimum [2,3,-1,-4]
-- Just (-1)

-- | Function to find the 2nd minimum element in the list
secondMinimum :: [Int] -> Maybe Int
secondMinimum xs
    | length uniqueSorted < 2 = Nothing -- Handle the case when there are less than two unique elements
    | otherwise = Just (head (tail uniqueSorted))
    where
        uniqueSorted = sort (nub xs)
