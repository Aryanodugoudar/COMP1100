module HOF where

-- Look at the following function. DO NOT EDIT IT.

buildFun :: [a -> a] -> a -> a
buildFun = bFHelper id
  where
    bFHelper f list = case list of
      []   -> f
      g:gs -> bFHelper (g . f) gs

-- | myBuildFun
--
-- Write a function that is mathematically identical to buildFun, but
-- uses either foldr or foldl rather than explicit recursion.
--
-- If you do not use foldr or foldl in this way,
-- you will recieve ZERO MARKS.
--
-- Examples:
--
-- >>> myBuildFun [] 0
-- 0
--
-- >>> myBuildFun [(+1),(*2)] 0
-- 2

myBuildFun :: [a -> a] -> a -> a
myBuildFun fs x = foldl (flip (.)) id fs x


-- | findFix
--
-- Given as input a function [a] -> [a], apply that function
-- repeatedly, starting with the empty list, and return the first list
-- (if any) that is mapped to itself.
--
-- Examples:
--
-- >>> findFix id
-- []
--
-- >>> findFix (show . length)
-- "1"

findFix :: Eq a => ([a] -> [a]) -> [a]
findFix = undefined -- TODO
