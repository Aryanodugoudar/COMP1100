module Recursion2 where

myLength :: [Char] -> Int
myLength list = case list of
    []   -> 0                      -- Base case
    _:xs -> 1 + (myLength xs)      -- Step case


squareAll :: [Int] -> [Int]
squareAll list = case list of
    []   -> []                     -- Base case
    x:xs ->  x^2 : (squareAll xs)  -- Step case


addOne :: [Int] -> [Int]
addOne list = case list of
    []   -> []                     -- Base case
    x:xs -> (x + 1) : (addOne xs)  -- Step case


isZero :: [Int] -> [Bool]
isZero list = case list of
    []   -> []                     -- Base case
    x:xs -> case x of              -- Step case
        0 -> True : (isZero xs)
        _ -> False : (isZero xs)

isZero2 :: [Int] -> [Bool]
isZero2 list = case list of
    []   -> []
    x:xs
        | x == 0    -> True : (isZero2 xs)
        | otherwise -> False : (isZero2 xs)

isZero3 :: [Int] -> [Bool]
isZero2 list = case list of
    []   -> []
    x:xs -> (x == 0) : (isZero3 xs)
