{-|
Module      : GPACalculator
Author      : Debashish Chakraborty, Aryan Odugoudar u7689173
Date        : 04/02/2019
Description : This module contains functions to calculate GPA from grades and marks.
-}

module GPACalculator where

data Grade = Fail | Pass | Credit | Distinction | HighDistinction 
   deriving Show

type GP = Double
type GPA = Double
type Mark = Double

data Course = Art Int -- Int denoted the course code
            | Comp Int 
            | Busn Int 
            | Math Int


-- | GPA.
--
-- >>> markToGrade 98
-- HighDistinction
--
-- >>> markToGrade 50
-- Pass


-- | Exercise 3
-- Convert marks to grade
markToGrade ::  Mark -> Grade
markToGrade mark
  | mark >= 80 && mark <= 100 = HighDistinction
  | mark >= 70 && mark <   80 = Distinction
  | mark >= 60 && mark <   70 = Credit
  | mark >= 50 && mark <   60 = Pass
  | mark >=  0 && mark <   50 = Fail
  | otherwise = error "markToGrade: Not a valid mark"

-- | Exercise 4
-- Your comment here
markToGrade' :: (Course, Mark) -> Grade
markToGrade' (course,mark) =  markToGrade mark

-- | Exercise 5
-- Your comment here
markToGradeSafe ::  Mark -> Maybe Grade
markToGradeSafe mark 
  | mark >= 0 && mark <= 100 = Just  (markToGrade(mark))
  | otherwise = Nothing 

-- | Exercise 6
-- Your comment here
maybeGradeToGPA :: Maybe Grade -> GPA
maybeGradeToGPA mark = case mark of
   Just HighDistinction -> 7
   Just Distinction -> 6
   Just Credit -> 5
   Just Pass -> 4
   Just Fail -> 0
   Nothing -> 0

-- | Exercise 7
-- Your comment here
markToGPA :: Mark -> GPA
markToGPA mark= maybeGradeToGPA(markToGradeSafe(mark))

-- | Exercise 8 
-- Your comment here 
markToGPAScaled:: (Course,Mark) -> GPA 
markToGPAScaled (course,mark) = case (course,mark) of
  (Busn a, m)
    | a<2000 -> (maybeGradeToGPA(markToGradeSafe(0.90*mark)))
    | otherwise -> (maybeGradeToGPA(markToGradeSafe(0.95*mark)))
  _-> maybeGradeToGPA(markToGradeSafe(mark))

