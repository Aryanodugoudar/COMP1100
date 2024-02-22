{-|
Module      : Lab05
Author      : Jane Doe, u1234567
Date        : 05/01/2019
Description : Recursion and Lists
-}

module Lab05 where

{-
Exercise 1: sumNumbers

Computes the sum of all numbers up to and including n.

sumNumbers 1 = 1
sumNumbers 2 = 3
sumNumbers 3 = 6
sumNumbers 4 = 10
...
-}

sumNumbers :: Integer -> Integer
sumNumbers n
    |n==0 = 0
    |n<0 = error "whoops!"
    |otherwise = n + sumNumbers (n-1)

{-
Exercise 2: factorial

Computes n!, the product of all positive integers less than
or equal to n.

Fix it so it doesn't infinite loop on negative inputs.
-}

factorial :: Integer -> Integer
factorial n
  | n == 0    = 1
  | n<0 = error "whoops!"
  | otherwise = n * (factorial (n-1))

{-
Exercise 3: rangeSum

Takes two integers, and returns the sum
of all integers from the first to the second, inclusive.

rangeSum 1 5 = 1 + 2 + 3 + 4 + 5 = 15
rangeSum 3 6 = 3 + 4 + 5 + 6 = 18
rangeSum 5 3 = ??? (what would be a sensible definition here?).
-}

rangeSum :: Integer -> Integer -> Integer
rangeSum n m
    |n==m =n
    |(m-n)<0 = error "Woops"
    |otherwise = n +(rangeSum (n+1) (m)) 


{-

Exercise 4: rangeSumEx

Takes two integers, and returns the
sum of all integers from the first to the second, inclusive of the first,
but exclusive of the second.

rangeSumEx 2 4 = 2 + 3 = 5
rangeSumEx 3 6 = 3 + 4 + 5 = 12

-}

rangeSumEx :: Integer -> Integer -> Integer
rangeSumEx n m
    |n==(m-1) =n
    |(m-n)<0 = error "Woops"
    |otherwise = n +(rangeSumEx (n+1) (m))

{-

Exercise 5: fibonacci

Takes an integer n, and returns the nth fibonacci number.

fibonacci 0 = 0
fibonacci 1 = 1
fibonacci 2 = 1
fibonacci 3 = 2
fibonacci 4 = 3
fibonacci 5 = 5
fibonacci 6 = 8
fibonacci 30 = 832040

The Fibonacci sequence F_n is as follows: 0,1,1,2,3,5,8,13,21,...
The pattern that the sequence follows is that the first two terms are defined
to be zero and one respectively, and then each
successive term is the sum of the previous two.

-}

fibonacci :: Integer -> Integer
fibonacci n
    |n==0=0
    |n==1=1
    |n<0= error "Wooops"
    |otherwise= (fibonacci (n-2))+(fibonacci (n-1))

{-
copy

Given an integer n and a charaacter c, returns a string of c's,
that is n long.
-}

copy :: Integer -> Char -> String
copy n c
    |n < 0 = error "copy: Cannot have negative copies of a character"
    |n == 0 = []
    |otherwise = c : copy (n-1) c

{-

Exercise 6: rangeList

Takes two integers `n` and `m`,
and returns a list of all numbers between `n` to `m` inclusive.

> rangeList 1 10
[1,2,3,4,5,6,7,8,9,10]
> rangeList (-2) 2
[-2,-1,0,1,2]
-}

rangeList :: Integer -> Integer -> [Integer]
rangeList n m
    |n==m = [n]
    |(m-n)<0 = error "Woops"
    |otherwise = n: (rangeList (n+1) m)

{-
sumList

Computes the sum of all integers in the list.
-}

sumList :: [Integer] -> Integer
sumList list = case list of
    []   -> 0
    x:xs -> x + sumList xs

{-
Exercise 7: lengthList

Computes the length of a list of integers.

> lengthList [1,2,3,4]
4
> lengthList []
0
-}

lengthList :: [Integer] -> Integer
lengthList list = case list of
    []   -> 0
    x:xs -> 1 +lengthList xs

{-
Exercise 8: firstList, lastList

Returns the first/last element of a list respectively.

> firstList [3,1,2,4]
3
> lastList [3,1,2,4]
4
-}

firstList :: [Integer] -> Integer
firstList list = case list of
    []   -> error "Woops"
    x:xs -> x

lastList :: [Integer] -> Integer
lastList list = case list of
    [x]   -> x
    x:xs -> lastList xs


{-
Exercise 9: prepend, append

`prepend` takes a `Char`, and a `String`, and adds the `Char` to the front
of the String

> prepend 'h' "ello"
"hello"

`append` takes a `Char` and a `String`, and adds the `Char` to the end
of the `String`

> append 'd' "worl"
"world"
-}

prepend :: Char -> String -> String
prepend a b = [a] ++ b

append :: Char -> String -> String
append a b = b ++ [a]

{-
Exercise 10: swapFirstTwo, swapLastTwo}

swapFirstTwo swaps the first two integers in a list of integers, if they exist.

>swapFirstTwo [1]
[1]
>swapFirstTwo [1,2,3]
[2,1,3]

swapLastTwo swaps the last two integers in a list of integers, if they exist.

>swapLastTwo [1]
[1]
>swapLastTwo [1,2,3]
[1,3,2]
-}

swapFirstTwo :: [Integer] -> [Integer]
swapFirstTwo list=case list of
    []->[]
    [x]->[x]
    (x:y:xs)-> y : x : xs

swapLastTwo :: [Integer] -> [Integer]
swapLastTwo list=case list of
    []->[]
    [x]->[x]
    xs -> init (init xs) ++ [last xs, last (init xs)]

{-

Exercise 11: find
Checks if a given element is inside a list or not.

>find 3 [1,2,3,4,5]
True
>find 9 [6,7,2]
False

-}


find :: Integer -> [Integer] -> Bool
find _ [] = False
find elem (x:xs)
    | elem == x = True
    | otherwise = find elem xs

-- EXTENSIONS --


{-
Example of how to write a recursive function using a helper function
to make the problem easier to solve.
-}

sumPoly :: Integer -> Integer
sumPoly n
  |n == 0 = 0
  |otherwise = (poly n) + sumPoly (n-1)
    where
    poly :: Integer -> Integer
    poly x = x*x + 3*x + 5
-- Extensions (OPTIONAL)
{-
Extension 1: gridList

Takes two `Integer` inputs,
`x` and `y`, and returns a list of tuples representing the coordinates
of each cell from `(1,1)` to `(x,y)`.

> gridList 3 3
[(1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3),(2,3),(3,3)]
-}

gridList :: Integer -> Integer -> [(Integer,Integer)]
gridList = undefined

{-
Extension 2: fastFib

Rewrite the fibonacci function so it runs quicker.
If you've done it correctly, try computing fastFib 100000.
Should take under a second.
-}

fastFib :: Integer -> Integer
fastFib = undefined
