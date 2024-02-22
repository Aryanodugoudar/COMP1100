module Pizza where

-- Ingredient, Pizza definitions. DO NOT EDIT THESE.

data Ingredient = 
    Tomato 
    | Basil 
    | Ham 
    | Mozzarella 
    | Salami 
    | Onion 
    | Chilli 
    | Pineapple
    deriving (Show, Eq)

data Pizza = Pizza Size [Ingredient] deriving (Show, Eq)

data Size = 
    Small 
    -- A small pizza requires one of each ingredient.
    | Medium
    -- A medium pizza requires two of each ingredient.
    | Large
    -- A large pizza requires three of each ingredient.
    deriving (Show, Eq)

-- Example Pizzas. Theses are example purposes only. 
-- You may be tested on other Pizzas.
-- You may assume that Pizza is a list of unique Ingredients.
--

margherita :: Pizza
margherita = Pizza Small [Tomato, Basil, Mozzarella]

diavola :: Pizza
diavola = Pizza Medium [Tomato, Salami, Onion, Chilli]

-- | hawaiian:
-- Given a size, return an example pizza containing the toppings 
-- Ham and Pineapple.
--
-- Examples:
--
-- >>> hawaiian Small
-- Pizza Small [Ham,Pineapple]
--
-- >>> hawaiian Large
-- Pizza Large [Ham,Pineapple]

hawaiian :: Size -> Pizza
hawaiian a = Pizza a [Ham,Pineapple]

-- | numPizza:
-- Given a Pizza and a list of Ingredient as input,
-- return the maximum number of the given Pizza 
-- that can be made from the given ingredients.
-- When the first input is empty, return 0.
--
-- Examples:
--
-- >>> numPizza margherita [Basil, Pineapple, Ham, Tomato, Tomato, Mozzarella]
-- 1
--
-- >>> numPizza diavola [] 
-- 0
--
-- >>> numPizza (hawaiian Large) [Ham, Ham, Ham, Ham, Ham, Ham, Pineapple, Pineapple, Pineapple]
-- 1
--

numPizza :: Pizza -> [Ingredient] -> Int
numPizza a b = case b of
    []->0
    
