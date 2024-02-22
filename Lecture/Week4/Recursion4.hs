module Recursion4 where

acronymR :: [String] -> String
acronymR list = case list of
    []   -> ""
    x:xs -> (head x) : (acronymR xs)

acronymAcc :: String -> [String] -> String
acronymAcc acc list = case list of
    []   -> acc
    x:xs -> acronymAcc (acc ++ [head x]) xs

acronymL :: [String] -> String
acronymL list = acronymAcc "" list


allR :: [Bool] -> Bool
allR list = case list of
    []   -> True
    x:xs -> x && (allR xs)

allAcc :: Bool -> [Bool] -> Bool
allAcc acc list = case list of
    []   -> acc
    x:xs -> allAcc (acc && x) xs

allL :: [Bool] -> Bool
allL = allAcc True


myZip :: [Int] -> [Char] -> [(Int, Char)]
myZip intList charList = case (intList, charList) of
    ([], _)      -> []
    (_, [])      -> []
    (x:xs, y:ys) -> (x,y) : (myZip xs ys)



