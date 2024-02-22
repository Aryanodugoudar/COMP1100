module Folds where

mySumr :: [Int] -> Int
mySumr list = case list of
  []   -> 0
  x:xs -> x + mySumr xs

myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr combine base list = case list of
  []   -> base
  x:xs -> combine x (myFoldr combine base xs)

mySuml :: [Int] -> Int
mySuml = mySumAcc 0
  where
    mySumAcc acc list = case list of
      [] -> acc
      x:xs -> mySumAcc (acc + x) xs

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl combine acc list = case list of
  []   -> acc
  x:xs -> myFoldl combine (combine acc x) xs