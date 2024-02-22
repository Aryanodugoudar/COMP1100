module Nim where

-- Copyright Antony Hosking, 2016.  With inspiration from notes by Dan Licata
-- from CMU 15-150, and reference to Hughes' "Why Functional Programming
-- Matters".
-- Modified by Ranald Clouston, 2019.

data Player = Max | Min
  deriving (Show, Eq)

switch :: Player -> Player
switch player = case player of
  Max -> Min
  Min -> Max

type Pebbles = Int

data State = State Player Pebbles
  deriving Show

won :: Player -> State -> Bool
won player (State turn pebbles) = pebbles == 0 && player == turn

moves :: State -> [State]
moves (State turn pebbles)
  | pebbles <= 0 = []
  | pebbles == 1 = [State next 0]
  | pebbles == 2 = [State next 1, State next 0]
  | otherwise =
      [State next (pebbles - 1),State next (pebbles - 2),State next (pebbles - 3)]
  where
    next = switch turn

data Rose a = Rose a [Rose a]

-- Ignore this code:
-- It is there to make the rose tree print nicer and contains constructions not
-- discussed in this course
instance Show a => Show (Rose a) where
  show = unlines . layout
    where
      layout :: Show a => Rose a -> [String]
      layout (Rose v []) = [show v]
      layout (Rose v children) = [show v] ++ concat (map indent (map layout children))
      indent :: [String] -> [String]
      indent = map ("  "++)

nimTree :: State -> Rose State
nimTree state = Rose state (map nimTree (moves state))

-- value for Max
value :: State -> Int
value state@(State turn _)
  | won Max state = 1
  | won Min state = -1
  | turn == Max   = maximum (map value (moves state))
  | otherwise     = minimum (map value (moves state))

-- | choice
--
-- Return a legal move.
-- If the game is winnable, return a choice that leads to a win.
--
-- >>> choice (Max,2)
-- (Min,1)
-- >>> choice (Max,4)
-- (Min,1)
-- >>> choice (Max,6)
-- (Min,5)

choice :: State -> State
choice = undefined