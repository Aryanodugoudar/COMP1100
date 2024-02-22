module MergeSort where

merge :: Ord a => [a] -> [a] -> [a]
merge list1 list2 = case (list1,list2) of
  ([],_) -> list2
  (_,[]) -> list1
  (x:xs,y:ys)
    | x <= y    -> x : merge xs list2
    | otherwise -> y : merge list1 ys

mSort :: Ord a => [a] -> [a]
mSort list = case list of
  []  -> []
  [x] -> [x]
  _   -> merge (mSort firstHalf) (mSort secondHalf)
  where
    half       = div (length list) 2
    firstHalf  = take half list
    secondHalf = drop half list