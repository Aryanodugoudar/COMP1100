module Filterable where

  -- New typeclass for type constructors that admit a function
  -- similar to the Prelude's 'filter' function on lists.
  -- DO NOT EDIT THIS TYPECLASS.

class Filterable t where

  adHocFilter :: (a -> Bool) -> t a -> t a

-- | adHocFilter
--
-- Make Maybe an instance of Filterable according to the specification:
-- - send Nothing to Nothing;
-- - if the predicate holds for x, return Just x;
-- - otherwise, return Nothing.
--
-- Examples:
--
-- >>> adHocFilter odd Nothing
-- Nothing
--
-- >>> adHocFilter odd (Just 1)
-- Just 1
--
-- >>> adHocFilter odd (Just 2)
-- Nothing

instance Filterable Maybe where
  adHocFilter _ Nothing  = Nothing
  adHocFilter p (Just x) = if p x then Just x else Nothing

-- Custom list definition. DO NOT EDIT THIS.
-- (Adding further 'deriving' statements is allowed, but not necessary)

data CustomList a = Empty | Cons a (CustomList a)
  deriving Show

-- | adHocFilter
--
-- Make CustomList an instance of Filterable, by defining a function
-- that filters out elements that fail a predicate, returning only the
-- elements that pass the predicate in their original order.
--
-- Examples:
--
-- >>> adHocFilter odd Empty
-- Empty
--
-- >>> adHocFilter odd (Cons 1 (Cons 2 (Cons 3 Empty)))
-- Cons 1 (Cons 3 Empty)

instance Filterable CustomList where
  adHocFilter _ Empty        = Empty
  adHocFilter p (Cons x xs)  = if p x then Cons x (adHocFilter p xs) else adHocFilter p xs
