module Sorting where

-- import used for sSort
import Data.List hiding (insert)

insert :: Ord a => a -> [a] -> [a]
insert x list = case list of
  [] -> [x]
  y:ys 
    | x <= y    -> x:list
    | otherwise -> y : insert x ys 

iSort :: Ord a => [a] -> [a]
iSort = foldr insert []

sSort :: Ord a => [a] -> [a]
sSort list = case list of
  [] -> []
  _  -> smallest : sSort (delete smallest list)
  where
    smallest = minimum list