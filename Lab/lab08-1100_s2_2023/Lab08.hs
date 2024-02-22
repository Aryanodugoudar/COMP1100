module Lab08 where

-- Week 8: Recursion
-- v1. David Quarel 07/01/19
-- update v2. Debashish Chakraborty 18/09/2021

{-
Exercise 1: compose

Takes two functions and an input, and performs
function composition.

Using the provided functions and compose,
complete the unfinished functions.

-}

compose :: (b -> c) -> (a -> b) -> a -> c
compose f g x = f (g x)

square :: Integer -> Integer
square x = x ^ 2

inc :: Integer -> Integer
inc x = x + 1

-- | Computes the function f(x) = (x+1)^2
incThenSquare :: Integer -> Integer
incThenSquare = compose square inc

-- | Computes the function f(x) = x^2 + 1
squareThenInc :: Integer -> Integer
squareThenInc = compose inc square

-- | Computes the function f(x) = x+2
add2 :: Integer -> Integer
add2 = compose inc inc

-- | Computes the function f(x) = x^4 + 1
quadThenInc :: Integer -> Integer
quadThenInc = compose inc (compose square square) 

{-
Exercise 2: myMap

Applies a function to each integer in a list.
Use myMap to implement incAll, negateAll, isLeast100All
-}

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs

incAll :: [Integer] -> [Integer]
incAll = myMap (+1)

negateAll :: [Bool] -> [Bool]
negateAll = myMap not

isLeast100All :: [Integer] -> [Bool]
isLeast100All = myMap (>= 100)


{-
Exercise 3: myFilter

`myFilter` takes two inputs:

* A list of type `a`
* A function that takes an `a` to a `Bool`

It returns the same list, but only keeping those elements for which
the function evaluated to `True`.

> filter even [1,2,3,4,5]
[2,4]
> filter (elem 'e') ["apple", "plum", "banana", "pear"]
["apple","pear"]
-}

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter p (x:xs)
    | p x       = x : myFilter p xs
    | otherwise = myFilter p xs


{-
Exercise 4: myZipWith

`myZipWith` takes three inputs:

* Two lists.
* A binary function with inputs that match the types of the two lists.

Output is the result of taking pairs of successive elements from
each list, and applying the operation.

>myZipWith (+) [1,2,3] [5,10,20]
[6,12,23]
>myZipWith (==) ["hello","cow"] ["world","cow"]
[False, True]
>myZipWith (elem) [3,6,1] [[1,2,3],[10,20,30],[-1, 0, 1]]
[True,False,True]
-}

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith func list1 list2 = case (list1, list2) of
    ([], []) -> []
    ([], _) -> []
    (_, []) -> []
    (x:xs, y:ys) -> func x y : myZipWith func xs ys



{-
Exercise 5:

`repeatApply` takes 3 inputs:

* A function `f`, with the same input and output type.
* An integer `n`, indicating the number of times to apply the function.
* An element `x` with suitable type to insert into the function.

Output is the result of applying the function `f` to `x`, `n` many times.
(So if `n=3`, the output should be `f(f(f(x)))`. Applying `f` zero many times
just returns `x` unchanged.)
Make the type as general as can be.

>repeatApply (*2) 3 1
8
>repeatApply (++ " NO") 5 "OH"
"OH NO NO NO NO NO"
-}

repeatApply :: (a -> a) -> Int -> a -> a
repeatApply f n x
    | n <= 0 = x
    | otherwise = repeatApply f (n - 1) (f x)


{-
Exercise 6: Rewriting with folds

Rewrite all of the functions `sumList, productList, allTrue, anyTrue,
concatenate` using either `foldLeft` or `foldRight`. The definition of
each function should only take up one line.
-}

foldRight :: (a -> b -> b) -> b -> [a] -> b
foldRight op e list = case list of
  [] -> e
  x : xs -> x `op` (foldRight op e xs)

foldLeft :: (b -> a -> b) -> b -> [a] -> b
foldLeft op e list = case list of
  [] -> e
  x : xs -> foldLeft op (e `op` x) xs


-- sumList using foldLeft
sumList :: [Integer] -> Integer
sumList = foldLeft (+) 0

-- productList using foldLeft
productList :: [Integer] -> Integer
productList = foldLeft (*) 1

-- allTrue using foldLeft
allTrue :: [Bool] -> Bool
allTrue = foldLeft (&&) True

-- anyTrue using foldLeft
anyTrue :: [Bool] -> Bool
anyTrue = foldLeft (||) False

-- concatenate using foldRight
concatenate :: [[a]] -> [a]
concatenate = foldRight (++) []

-- doNothingList using foldRight
doNothingList :: [a] -> [a]
doNothingList = foldRight (:) []


{-
Exercise 7: Using higher order functions.

Complete the following functions:
positiveSum, average, magnitude, dot
-}


positiveSum :: [Integer] -> Integer
positiveSum = foldr (\x acc -> if x > 0 then x + acc else acc) 0

average :: [Double] -> Double
average xs = sum xs / fromIntegral (length xs)

magnitude :: [Double] -> Double
magnitude = sqrt . sum . map (^2)

dot :: [Double] -> [Double] -> Double
dot xs ys = sum (zipWith (*) xs ys)



{-
Exercise 8: Maximum using a fold.

Complete the myMaximum function using a fold.
-}

myMaximum :: [Integer] -> Integer
myMaximum [] = error "Empty list"
myMaximum xs = foldLeft (\acc elem -> if elem > acc then elem else acc) (head xs) xs



-- EXTENSIONS --
{-
Extension 1

Try and figure out how to reverse a list using a fold.

-}

reverseFold :: [a] -> [a]
reverseFold list = fold func basecase list
  where
    func a b = error "reverseFold: func undefined"
    basecase = error "reverseFold: basecase undefined"
    fold = error "reverseFold: Replace me with either foldr or foldrl!"

{-
Extension 2

Emulate a `map` using a fold.
-}

mapFold :: (a -> b) -> [a] -> [b]
mapFold f list = fold func basecase list
  where
    func a b = error "mapFold: func undefined"
    basecase = error "mapFold: basecase undefined"
    fold = error "mapFold: Replace me with either foldr or foldrl!"

{-
Extension 3

Emulate a `filter` using a fold.
-}

filterFold :: (a -> Bool) -> [a] -> [a]
filterFold predicate list = fold func basecase list
  where
    func a b = error "filterFold: func undefined"
    basecase = error "filterFold: basecase undefined"
    fold = error "mapFold: Replace me with either foldr or foldrl!"
