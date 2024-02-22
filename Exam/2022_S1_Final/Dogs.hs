module Dogs where

-- Note that there are TWO functions for you to complete in this file.
-- It is NOT necessary to complete the first function
-- before attempting the second.

-- Type definitions. DO NOT DELETE OR EDIT THESE.
-- You may add deriving statements.
--
-- A Dog's ancestry is defined as either
-- - a Pure breed of a certain sort, or
-- - a Cross between the ancestries of its father and mother.

data PureBreed = GreatDane | Labrador | Poodle | Pug
  deriving Show

data Dog = Pure PureBreed | Cross Dog Dog
  deriving Show

-- | isOodle:
--
-- Given a Dog as input,
-- return True if any part of its ancestry is Poodle.
--
-- Examples:
--
-- >>> isOodle (Pure Poodle)
-- True
--
-- >>> isOodle (Cross (Pure Labrador) (Pure Poodle))
-- True

isOodle :: Dog -> Bool
isOodle = undefined

-- | simplify:
--
-- If any part of a Dog's ancestry
-- is a Cross between any number of copies of the same PureBreed,
-- simplify that part of the Dog's ancestry to be Pure.
-- 
-- Examples:
--
-- >>> simplify (Cross (Pure Poodle) (Cross (Pure Poodle) (Pure Poodle)))
-- Pure Poodle
--
-- >>> simplify (Cross (Cross (Pure GreatDane) (Pure GreatDane)) (Cross (Pure Pug) (Pure Pug)))
-- Cross (Pure GreatDane) (Pure Pug)

simplify :: Dog -> Dog
simplify = undefined