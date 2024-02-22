module Recursion3 where


myMinimum :: [Double] -> Double
myMinimum list = case list of
    []   -> error "Empty list has no minimum!"
    [x]  -> x
    y:ys -> min y (myMinimum ys)


-- Computes the product of all integers in a list,
-- and returns 1 if the list is empty
myProductR :: [Int] -> Int
myProductR list = case list of
    []   -> error "Cannot take product of empty list!"
    [x]  -> x
    y:ys -> y * (myProductR ys)


-- Helper function for myProductL
myProductSoFar :: Int -> [Int] -> Int
myProductSoFar soFar list = case list of
    []   -> soFar
    y:ys -> myProductSoFar (y * soFar) ys

-- Computes the product of all integers in a list,
-- but traverses the list from the left
myProductL :: [Int] -> Int
myProductL list = myProductSoFar 1 list


-- acronymR and acronymL take in a list of strings,
-- and return a string consisting of the first symbol
-- of each of the strings in the input.
acronymR :: [String] -> String
acronymR list = case list of
    []   -> ""
    y:ys -> (head y) : (acronymR ys)

-- Helper function for acronymL
acronymSoFar :: String -> [String] -> String
acronymSoFar soFar list = case list of
    []   -> soFar
    y:ys -> acronymSoFar (soFar ++ [head y]) ys

acronymL :: [String] -> String
acronymL list = acronymSoFar "" list
