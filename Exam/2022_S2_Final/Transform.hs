module Transform where

-- ***************************************************************************
-- f(x) = x + 2
-- g(x) = x - 5
-- h(xs) = let xi denote the ith element of xs: x0, x1, x2 ... etc.
--        such that Π (from i = 0 to i = length xs - 1) xi
--
-- (see the exam question on gradescope for the actual math render)
--
-- The Π symbol asks you to multiply all the element of 'xs' together
-- in a similar fashion that Σ would ask you to sum up elements.
--
-- write a function 'transform' that takes a list of integers and
-- applies 'f' to every element, then applies 'g' and finally
-- applies 'h' to the resulting list. 
-- Do not use explicit (manual) recursion. 
-- Use higher order functions.

-- | Transforming a list of integers.
--
-- >>> transform [1, 2, 3, 4, 5]
-- 0
-- 
-- >>> transform [1, 1, 1, 1, 1]
-- -32
--
-- >>> transform []
-- 1
-- 
-- >>> transform [1, -1, 2, -3, 4]
-- 48
--
-- >>> transform [6, 7, 8, 9]
-- 360

transform :: [Integer] -> Integer
transform = undefined
