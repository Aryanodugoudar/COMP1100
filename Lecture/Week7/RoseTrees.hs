module RoseTrees where

data Rose a = Rose a [Rose a]

testRose :: Rose Int
testRose = Rose 5 [Rose 3 [Rose 1 [], Rose 4 []], Rose 7 [], Rose 4 []]

sumRose :: Rose Int -> Int
sumRose (Rose x roses) = x + sum (map sumRose roses)

height :: Rose a -> Int
height (Rose _ roses) = case roses of
  []   -> 0 
  _    -> 1 + maximum (map height roses)