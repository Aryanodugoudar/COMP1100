module MaybeProd where

-- | maybeProd is a function that,
-- given two input values of type 'Maybe Int',
-- returns 'Nothing' if at least one input value is Nothing,
-- and returns 'Just (x * y)' if the input values are of
-- the form 'Just x' and 'Just y'.
-- 
-- Examples:
--
-- >>> maybeProd (Just 3) Nothing
-- Nothing
--
-- >>> maybeProd Nothing (Just 5)
-- Nothing
--
-- >>> maybeProd (Just 3) (Just 5)
-- Just 15

maybeProd :: Maybe Int -> Maybe Int -> Maybe Int
maybeProd x y = case (x,y) of 
    (Just x, Just y) -> Just (x*y)
    _ -> Nothing