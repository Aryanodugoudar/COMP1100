module ReplaceSecond where

-- | replaceSecond:
-- Given a Double and a list of Doubles as input,
-- return the input list unchanged, except that
-- the second element of the input list is replaced by the input Double.
-- If the list has fewer than two elements, return the list unchanged.
--
-- Examples:
--
-- >>> replaceSecond 1.1 [0.0]
-- [0.0]
--
-- >>> replaceSecond 1.1 [0.0,2.2,3.3,4.4]
-- [0.0,1.1,3.3,4.4]

replaceSecond :: Double -> [Double] -> [Double]
replaceSecond _ [] = []                   
replaceSecond x (y:ys)
    | length ys <1 = y:ys             
    | otherwise = y : x : tail ys   


