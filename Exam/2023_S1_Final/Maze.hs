module Maze where

-- **This file is for both COMP1100 and COMP1130 students**

-- There are three functions to complete in this file
-- It is NOT necessary to complete the first question
-- to attempt the later questions.
-- It IS necessary to complete the second question to fully test the third,
-- BUT you can get full marks for the third function
-- even if the second function is incomplete or incorrect.

-- Type declarations for directions in a maze.
-- DO NOT EDIT OR DELETE THESE
-- (You may add 'deriving' clauses)

data Direction = MazeLeft | MazeRight | MazeStraight
  deriving (Show,Eq)

-- | changeDirections:
-- Given a list of Directions as input,
-- return a new list of Directions,
-- where each MazeLeft has been replaced with MazeRight,
-- and each MazeRight has been replaced with MazeLeft.
-- MazeStraight elements should not change.
--
-- Examples:
--
-- >>> changeDirections []
-- []
--
-- >>> changeDirections [MazeLeft]
-- [MazeRight]
--
-- >>> changeDirections [MazeRight, MazeStraight, MazeRight]
-- [MazeLeft,MazeStraight,MazeLeft]

changeDirections :: [Direction] -> [Direction]
changeDirections [] = []
changeDirections (d:ds) = case d of
  MazeLeft     -> MazeRight : changeDirections ds
  MazeRight    -> MazeLeft : changeDirections ds
  MazeStraight -> MazeStraight : changeDirections ds


-- | correctSubPath:
-- Take two lists of Directions as input,
-- where the first list represents the correct solution to the maze,
-- and the second list represents a player's attempt at the maze.
--
-- Return the longest possible *correct* initial part of the attempt.
-- i.e. if the first Direction of the attempt is the same as
-- the first Direction of the solution,
-- that should be the first element of the output,
-- but where an incorrect move is made, the output should end.
--
-- Examples:
--
-- >>> correctSubPath [MazeLeft, MazeLeft, MazeStraight, MazeRight] [MazeLeft, MazeLeft, MazeRight, MazeStraight, MazeLeft]
-- [MazeLeft,MazeLeft]
--
-- >>> correctSubPath [MazeRight,MazeStraight] [MazeLeft,MazeStraight]
-- []
--
-- >>> correctSubPath [MazeRight,MazeStraight,MazeLeft] [MazeRight,MazeLeft]
-- [MazeRight]
--
-- >>> correctSubPath [MazeRight,MazeStraight,MazeRight] []
-- []

correctSubPath :: [Direction] -> [Direction] -> [Direction]
correctSubPath [] _ = []
correctSubPath _ [] = []
correctSubPath (sol:restSol) (attempt:restAttempt)
  | sol == attempt = sol : correctSubPath restSol restAttempt
  | otherwise = []


-- | findWinner:
-- Given a list of Directions representing the correct solution to the maze,
-- and a list of lists of Directions representing various players' attempts,
-- return the index (list position) of the attempt (in the list of lists)
-- with the longest correct subpath, 
-- according to the definition of correctSubPath above.
-- Recall that the first element of a list has index 0.
--
-- In the event of a tie, return the smaller index.
-- If the list of attempts is empty, return -1.
--
-- Examples:
--
-- >>> findWinner [MazeLeft,MazeRight,MazeStraight,MazeRight] []
-- -1
--
-- >>> findWinner [MazeLeft,MazeRight,MazeStraight,MazeRight] [[MazeLeft,MazeRight,MazeLeft,MazeLeft], [MazeLeft,MazeRight,MazeStraight,MazeLeft]]
-- 1

findWinner :: [Direction] -> [[Direction]] -> Int
findWinner _ [] = -1
findWinner solution attempts = go attempts 0 (-1) 0
  where
    go [] _ maxIndex _ = maxIndex
    go (attempt:rest) currentIndex maxIndex maxLength =
      let currentLength = length (correctSubPath solution attempt)
      in if currentLength > maxLength
        then go rest (currentIndex + 1) currentIndex currentLength
        else go rest (currentIndex + 1) maxIndex maxLength