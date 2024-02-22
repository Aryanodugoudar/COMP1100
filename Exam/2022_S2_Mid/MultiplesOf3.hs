module MultiplesOf3 where

-- Write a function, 'multiplesOf3' that takes a given list of 'Int'
-- and returns a list containing only the elements that are multiples
-- of the number 3.
--
--   hint: recall the mod function from the prelude.
--
--   example:
--     multiplesOf3 [21, 7, 15, 1] = [21, 15]
multiplesOf3 :: [Int] -> [Int]
multiplesOf3 list=case list of
    [] -> []
    x:xs
        | (rem x 3)==0 -> x : multiplesOf3 xs
        | otherwise -> multiplesOf3 xs
