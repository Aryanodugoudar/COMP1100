module HOF where

dupl :: Int -> Char -> String
dupl n c
    | n <= 0    = []
    | otherwise = c : (dupl (n-1) c)

myAnd :: [Bool] -> Bool
myAnd = foldr (&&) True

myConcat :: [String] -> String
myConcat = foldr (++) ""
