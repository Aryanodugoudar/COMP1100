module Places where

-- Note that there are TWO functions for you to complete in this file.
-- It is NOT necessary to complete the first function
-- before attempting the second.

-- Type definitions. DO NOT DELETE OR EDIT THESE.
--
-- A Place is either
-- - A Nation, or
-- - A Part (of a Nation), in which
--     the first PlaceName is the name of the particular place, and
--     the second PlaceName is the name of the Nation it is Part of

type PlaceName = String

data Place
  = Nation PlaceName
  | Part PlaceName PlaceName
  deriving Show

-- | getNation:
-- Given a Place as input,
-- return the PlaceName of the Nation it is,
-- or the PlaceName of the Nation it is Part of 
--
-- Examples:
--
-- >>> getNation (Nation "New Zealand")
-- "New Zealand"
--
-- >>> getNation (Part "Java" "Indonesia")
-- "Indonesia"

getNation :: Place -> PlaceName
getNation place= case place of
  Nation a -> a
  Part a b -> b

-- | destination:
-- Given a Place as input,
-- if it is a Part, return it unchanged as the output;
-- if it is a Nation, return a Part whose
-- - first PlaceName is "Unknown location", and
-- - second PlaceName is the PlaceName of the Nation.
--
-- Examples:
--
-- >>> destination (Part "Shandong" "China")
-- Part "Shandong" "China"
--
-- >>> destination (Nation "Papua New Guinea")
-- Part "Unknown location" "Papua New Guinea"

destination :: Place -> Place
destination place = case place of
  Nation a -> Part "Unknown location" a
  Part a b -> Part a b