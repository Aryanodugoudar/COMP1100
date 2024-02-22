module Intervals where

-- Note that there are TWO functions for you to complete in this file.
-- It is NOT necessary to complete the first function
-- before attempting the second.

-- Type definition. DO NOT DELETE OR EDIT IT.
-- You may add deriving statements.
--
-- The Interval type is intended to be understood as
-- the closed interval between its two Ints
-- (where 'closed' means including its endpoints)
-- e.g. Between 2 5 is the set {2,3,4,5},
-- and Between 5 2 is understood similarly.

data Interval = Between Int Int
  deriving Show

-- Your job is to make Interval an instance of the Enum typeclass,
-- by writing fromEnum and enumFrom.
--
-- (Aside: a definition of fromEnum is necessary for any type in Enum;
-- you are asked to write enumFrom because the default behaviour for
-- this function is not what is desired in this case.)
--
-- Definitions of toEnum and succ are provided for you.
-- DO NOT EDIT THEM.
-- succ is likely to be useful as a helper function;
-- you are not likely to use toEnum, but it is provided for completeness.

-- | fromEnum:
--
-- Given an Interval as input,
-- return the Int in that Interval (i.e. between the Interval's two values)
-- which is closest to zero.
--
-- Examples:
--
-- >>> fromEnum (Between 2 5)
-- 2
--
-- >>> fromEnum (Between (-2) (-5))
-- -2
--
-- >>> fromEnum (Between 3 (-8))
-- 0

-- | enumFrom:
--
-- Given an Interval as an input,
-- return the stream (infinite list) of Intervals
-- whose first element is the input,
-- second element is the successor of the input,
-- third element is the successor of the successor of the input,
-- and so on.
--
-- Example:
--
-- >>> take 5 (enumFrom (Between 2 5))
-- [Between 2 5,Between 3 6,Between 4 7,Between 5 8,Between 6 9]

instance Enum Interval where

  toEnum x = Between x x

  succ (Between x y) = Between (x+1) (y+1)

  fromEnum = undefined

  enumFrom = undefined