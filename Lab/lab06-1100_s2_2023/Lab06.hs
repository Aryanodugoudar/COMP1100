module Lab06 where

-- Lab 06 : More lists, Parametric polymorphism, recursive data types


-- ===== MORE LIST OPERATIONS ====== --

{-
Exercise 1

Write a function that takes a list of elements packed inside a `Maybe` type,
and returns a list containing the elements. Any `Nothing`'s present in the
original list should be discarded.
You will have to work out the type declaration. Make it as general as possible.

> unMaybe [Just 1, Nothing, Just 2]
[1,2]
> unMaybe [Nothing, Just "hello", Just "world"]
["hello","world"]
-}

unMaybe :: [Maybe a] -> [a]
unMaybe list= case list of
    []->[]
    (x : xs)
        | Just val <- x -> val : unMaybe xs
        | otherwise     -> unMaybe xs



{-
Exercise 2

Write a parametric polymorphic function `join`, that takes two lists of any type,
and joins them together to return a list of the same type.
You will have to figure out the type declaration of the function yourself.
You should not use `++` or any other predefined functions.

>join [1,2,3] [4,5,6]
[1,2,3,4,5,6]
>join "hello" "world"
"helloworld"
-}

join :: [a]->[a]->[a]
join a b = case a of
    []->b
    (x:xs)  -> x :join xs b

{-
Exercise 3

Using our new function `(++)` (or `join`), try to define `rev`, a function
that takes a list and returns the same list, reversed. Make sure the function
is polymorphic!

>rev "Hello, World!" 
"!dlroW ,olleH"
>rev [1,2,3]
[3,2,1]

-}

rev :: [a]->[a]
rev list = case list of
    []->[]
    x:xs -> join(rev xs) [x]

{-
Exercise 4

Write a function that takes two lists and performs a "riffle" shuffle,
alternating back and forth to return all elements from both lists.
If one list has more elements than the other, just add the rest of the 
non-empty list to the end.

>riffle [1,2,3] [4,5,6]
[1,4,2,5,3,6]
>riffle [1,2,3] [10,20,30,40,50,60]
[1,10,2,20,3,30,40,50,60]
>riffle ['h','s','e','l','l'] ['a','k']
"haskell"

-}

riffle :: [a]->[a]->[a]
riffle a b = case a of
    []->b
    (x:xs)->case b of
        []->a
        (y:ys)-> x: y : riffle xs ys


{-
Exercise 5

Try writing a new function, `fastRev`, that reverses the list in a more
efficient manner. Evaluating `last (rev [1..10000])` should appear
to be instantaneous if you've written it correctly.

-}

fastRev :: [a] -> [a]
fastRev xs = revAcc xs []
  where
    revAcc [] acc = acc
    revAcc (x:xs) acc = revAcc xs (x:acc)


-- ==== RECURSIVE DATA TYPES ==== 

data Nat = Z | S Nat
    deriving Show 
    {- "deriving Show" tells Haskell to allow conversion from Nat to String,
     so we can print the result in the Terminal to look at -}

-- Example functions

isOne :: Nat -> Bool
isOne n = case n of
    Z     -> False
    S Z -> True
    S _ -> False

increment :: Nat -> Nat
increment n = (S n)

decrement :: Nat -> Nat
decrement n = case n of
    Z   -> error "decrement: Zero has no predecessor"
    S m -> m

{-
Exercise 6

Try and write a function `natEq` that checks if two natural numbers are
equal. What should the type be?

>natEq (S Z) (S Z)
True
>natEq (S (S Z)) (S Z)
False
-}

natEq :: Nat -> Nat -> Bool
natEq n1 n2 = case (n1, n2) of
    (Z, Z) -> True
    (S _, Z) -> False
    (Z, S _) -> False
    (S n1', S n2') -> natEq n1' n2'


{-
Exercise 7

Try and define addition on natural numbers.
What should the type be?

>addNat Z (S Z)
(S Z)
>addNat (S (S Z)) (S (S (S Z)))
S (S (S (S (S Z))))
-}

addNat :: Nat -> Nat -> Nat
addNat m n = case m of
    Z -> n
    S m' -> S (addNat m' n)


{-
Exercise 8
Write a function that checks if a natural number is even.

>isNatEven Z
True
>isNatEven (S Z)
False
>isNatEven (S (S Z))
True
-}

isNatEven :: Nat -> Bool
isNatEven n = case n of
    Z -> True
    S Z -> False
    S (S n') -> isNatEven n'


{-
Exercise 9
Write functions that can convert from an `Integer` to a `Nat`, and back again.

-}
natToInt :: Nat -> Integer
natToInt n = case n of
    Z -> 0
    S n' -> 1 + natToInt n'

intToNat :: Integer -> Nat
intToNat n = case n of
    n' | n' <= 0 -> Z
       | otherwise -> S (intToNat (n' - 1))





-- =========== EXTENSIONS ==========

{-
Extension 1: 

Write a function `powerset` that takes a list, and generates all possible sublists,
ignoring ordering of the elements in the sublists.
The order that the sublists are listed also doesn't matter.

powerset [1,2,3]
[[1,2],[1,2,3],[1],[1,3],[2],[2,3],[],[3]]
-}

powerset :: [a] -> [[a]]
powerset = undefined

{-
Extension 2:

Write a function that accepts a list of positive integers and a target sum.
which returns all sub-sequences of the original list that add up to the
target sum.

>rucksack [3,7,5,9,13,17] 30 
[[13,17],[3,5,9,13]]
-}

rucksack :: [Integer] -> Integer -> [[Integer]]
rucksack = undefined


{-
Extension 3:

Try to come up with a definition for all integers, such that
each number has a unique representation.
-}

-- data MyInteger = ???
