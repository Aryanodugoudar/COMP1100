module RoseTreePaths where

-- Do not edit anything between the lines!
-- ***************************************************************************
data Colour = Red | Green | Blue
  deriving (Eq, Show)

-- MkRose is pronounced "make rose" and is used to clearly differentiate 
-- between the type constructor and the data constructor.
data Rose a = MkRose a [Rose a]
  deriving Show

-- Example tree for testing purposes
tree1 :: Rose Colour
tree1 = MkRose Red [MkRose Blue [MkRose Red [], MkRose Blue []],
                   MkRose Red [MkRose Green []],
                   MkRose Blue [MkRose Blue [MkRose Green []], 
                                             MkRose Red []]]

-- Example tree for testing purposes
tree2 :: Rose Colour
tree2 = MkRose Green [MkRose Green [], MkRose Green [], MkRose Red []]

-- Example Tree for testing purposes
tree3 :: Rose Colour
tree3 = MkRose Red [MkRose Blue [MkRose Green []], 
                    MkRose Blue [MkRose Green [MkRose Red []]], 
                    MkRose Blue [MkRose Green []]]
-- ***************************************************************************

-- Write a 'flatten' function that flattens a list of list into a single
-- list in order:

-- | Flattening lists of lists.
--
-- >>> flatten ["Hello", ", ", "world", "!"]
-- "Hello, world!"
--
-- >>> flatten [[1, 2, 3, 4], [], [5, 6]]
-- [1,2,3,4,5,6]

flatten :: [[a]] -> [a]
flatten = undefined

-- Now write a function 'flatMap' that maps a function over each 
-- list-element inside our list of lists, and then flattens the result.
-- 'flatMap' MUST use 'flattern'.

-- | Flattening a map over a list of lists.
--
-- >>> flatMap (map (+1)) [[1, 2, 3], [4], [5, 6]]
-- [2,3,4,5,6,7]
--
-- >>> flatMap (take 3) [[1 ..], [3 ..], [5 ..]]
-- [1,2,3,3,4,5,5,6,7]
--
-- >>> flatMap reverse [[1, 2, 3], [4, 5, 6]]
-- [3,2,1,6,5,4]

flatMap :: (a -> [b]) -> [a] -> [b]
flatMap = undefined

-- Finally, write a function 'pathsToGreen' that returns a list of
-- all colours seen as we traverse through a tree of 'Rose Colour'
-- until a 'Green' colour is reached. 
-- Return an empty list if 'Green' is not found.
-- 
-- You MUST use flatmap in either your definition of 'pathsToGreen',
--   or in its helper functions or local definitions.

-- | Find the paths through the tree until 'Green'.
-- 
-- >>> pathsToGreen tree1
-- [[Red,Red,Green],[Red,Blue,Blue,Green]]
--
-- >>> pathsToGreen (MkRose Red [])
-- []
--
-- >>> pathsToGreen tree2
-- [[Green]]
--
-- >>> pathsToGreen tree3 
-- [[Red,Blue,Green],[Red,Blue,Green],[Red,Blue,Green]]

pathsToGreen :: Rose Colour -> [[Colour]]
pathsToGreen = undefined







