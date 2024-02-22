module EqLists where

-- **This file is for both COMP1100 and COMP1130 students**

-- There are two functions to complete in this file
-- It is NOT necessary to complete the first to attempt the second

-- Type declarations for RangeList and MatchList
-- DO NOT EDIT OR DELETE THESE
-- (You may add 'deriving' clauses)

data RangeList a = Range [a]

data MatchList a = Match [a]

-- | (==):
-- If a type a is an instance of the typeclass Ord,
-- make RangeList a an instance of the typeclass Eq,
-- by defining (==) so that Range xs == Range ys only if
-- - both are empty, or
-- - both are non-empty, and
--   the maximum element of xs is equal to the maximum element of ys, and
--   the minimum element of xs is equal to the minimum element of ys
--
-- Examples:
--
-- >>> Range [] == Range []
-- True
--
-- >>> Range [] == Range "ab"
-- False
--
-- >>> Range "efghijklmno" == Range "hello"
-- True
--
-- >>> Range "efghijkl" == Range "hello"
-- False


instance Ord a => Eq (RangeList a) where
  (Range xs) == (Range ys) = case (xs, ys) of
    ([], []) -> True
    ([], _)  -> False
    (_, [])  -> False
    _        -> maximum xs == maximum ys && minimum xs == minimum ys


-- | (==):
-- If a type a is an instance of Eq,
-- make MatchList a an instance of Eq,
-- by defining (==) so that Match xs == Match ys only if
-- - at least half of the elements of xs appear in ys, and
-- - at least half of the elements of ys appear in xs
--
-- Examples:
--
-- >>> Match [] == Match []
-- True
--
-- >>> Match [1,3,5] == Match [4,3,2,1]
-- True
--
-- >>> Match [1,3,5] == Match [4,3,2,1,0]
-- False


instance Eq a => Eq (MatchList a) where
  (Match xs) == (Match ys) =
    let halfLenXs = length xs `div` 2
        halfLenYs = length ys `div` 2
        commonXs = length (filter (`elem` ys) xs)
        commonYs = length (filter (`elem` xs) ys)
    in commonXs >= halfLenXs && commonYs >= halfLenYs

