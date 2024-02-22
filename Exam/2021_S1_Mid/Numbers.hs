module Numbers where

-- | listProduct:
-- Given two lists of Ints as input,
-- multiply the two lists element by element, 
-- until the shorter list is exhausted.
-- Then return the sum of the multiplications.
-- When one of the lists is empty, return 0.
--
-- For example, given two lists [1,2,3] [4,5],
-- return 1*4 + 2*5 
--
-- Examples:
--
-- >>> listProduct [] [1,2,3]
-- 0
--
-- >>> listProduct [1,2,3] [1,2,3]
-- 14
--

listProduct :: [Int] -> [Int] -> Int
listProduct = undefined

-- | isPyth:
-- Given a triple of positive Ints, 
-- decide if the integers, in any order, saitisfy the Pythagorean equation, 
-- a^2 + b^2 = c^2. 
-- Return True if the Ints can satisfy the equation.
-- For example, given (4,5,3) as input, return True (3^2+4^2=5^2).
-- 
-- Note that it is not useful to complete listProduct before you attempt this question.
--
-- Examples:
-- 
-- >>> isPyth (1,2,3)
-- False
--
-- >>> isPyth (5,4,3)
-- True
--
isPyth :: (Int, Int, Int) -> Bool
isPyth = undefined

