module BoolFunctions where

-- Note that there are TWO functions for you to complete in this file.
-- It is NOT necessary to complete the first function
-- before attempting the second.

-- | inverse:
--
-- Given as input
-- - a function from Bool to any a in Eq, and
-- - an element of a,
-- use a Maybe type to return the Bool that maps to a.
-- If no Boolean, or both Booleans, map to a, return Nothing.
--
-- Examples:
--
-- >>> inverse show "True"
-- Just True
--
-- >>> inverse show "Neither"
-- Nothing
--
-- >>> inverse (\_ -> 0) 0
-- Nothing

inverse :: Eq a => (Bool -> a) -> a -> Maybe Bool
inverse = undefined

-- | allEq:
--
-- Given as input a list of functions from Bool to any a in Eq,
-- return True if they all define the same mathematical function.
-- Return False otherwise.
--
-- Examples:
--
-- >>> allEq []
-- True
--
-- >>> allEq [id,\b -> b,(== True),(&& True)]
-- True
--
-- >>> allEq [\_ -> 0,\_ -> 1]
-- False

allEq :: Eq a => [Bool -> a] -> Bool
allEq = undefined