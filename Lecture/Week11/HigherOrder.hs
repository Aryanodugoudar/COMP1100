module HigherOrder where

-- **This file is for both COMP1100 and COMP1130 students**

-- There are three functions to complete in this file.
-- It IS necessary to complete the first function
-- to fully test the later functions, 
-- BUT you can get full marks for the second and third functions
-- even if the first function is incomplete or incorrect.
--
-- The first function, increaseGrades, is worth 2 marks;
-- the second function, applyAdvanced, is worth 3 marks;
-- the third function, applyToManyCourses, is worth 5 marks.

-- | increaseGrades:
-- A teacher wants a function that modifies all students' grades
-- by first multiplying each grade by a number,
-- and then adding another number to the results.
--
-- The first input is the Int to multiply with,
-- the second is the Int to add,
-- and the third is the list of raw grades.
-- The function returns the list of Ints suitably altered.
--
-- Examples:
--
-- >>> increaseGrades 2 5 []
-- []
--
-- >>> increaseGrades 2 5 [1,2,3,4]
-- [7,9,11,13]
--
-- >>> increaseGrades 3 4 [1,2,3,4]
-- [7,10,13,16]

increaseGrades :: Int -> Int -> [Int] -> [Int]
increaseGrades mult add grades = map (\g -> g * mult + add) grades

-- | applyAdvanced:
-- The teacher has a group of students who have completed 
-- some advanced work which means that they deserve extra marks.
-- Define a function that, given a list of grades as input,
-- multiplies each grade by 4,
-- then adds 12.
--
-- This function MUST be defined using partial application.
-- Answers that do not use partial application will receive zero marks.
--
-- Examples:
--
-- >>> applyAdvanced []
-- []
--
-- >>> applyAdvanced [1,2,3,4]
-- [16,20,24,28]

applyAdvanced :: [Int] -> [Int]
applyAdvanced = increaseGrades 4 12

-- | applyToManyCourses:
-- A group of teachers wish to modify grades across multiple courses
-- by multiplying them by 5 and then adding 10.
--
-- Write a function that applies this transformation
-- to all grades in multiple classes (represented as a list of lists).
--
-- You MUST use a higher-order function,
-- that takes a function as input,
-- from the Prelude or Data.List,
-- to complete this question.
-- Answers that do not use such a function will receive zero marks.
--
-- Examples:
--
-- >>> applyToManyCourses []
-- []
--
-- >>> applyToManyCourses [[1,2,3,4],[5,6],[1]]
-- [[15,20,25,30],[35,40],[15]]

applyToManyCourses :: [[Int]] -> [[Int]]
applyToManyCourses = map (increaseGrades 5 10)