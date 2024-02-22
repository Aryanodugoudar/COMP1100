module Meal where

-- Main, Side, Calories, Meal definitions. DO NOT EDIT THESE.

data Main = Fish | Chicken | Tofu deriving Show  
 
data Side = Salad | Potato | Bread deriving Show

type Calories = Int

data Meal = Meal Main Side (Maybe Side) Calories deriving Show

-- | takeSide:
-- Given a Meal as input, 
-- return a pair of the Sides in the Meal.
--
-- Note that it is NOT necessary to complete the previous questions
-- before attempting this question.
--
-- Examples:
--
-- >>> takeSide (Meal Fish Potato (Just Salad) 500)
-- (Potato,Just Salad)
--
-- >>> takeSide (Meal Chicken Salad Nothing 300)
-- (Salad,Nothing)

takeSide :: Meal -> (Side,Maybe Side)
takeSide = undefined -- TODO

-- | calcCals:
-- Given a pair of Main and Calories, a pair of Side and Calories, 
-- and a Maybe pair of Side and Calories,
-- return Maybe Meal that is constructed by the input.
-- Calories in Meal should represent the sum of all calories 
-- from the Main and Sides.
--
-- If any of input calories is negative, return Nothing.
--
-- Note that it is NOT necessary to complete the previous question
-- before attempting this question.
--
-- Examples:
--
-- >>> calcCals (Tofu, 100) (Potato, 100) (Just (Salad, 50)) 
-- Just (Meal Tofu Potato (Just Salad) 250)
--
-- >>> calcCals (Fish, 200) (Bread, -1) Nothing
-- Nothing
--
calcCals :: (Main,Calories) -> (Side,Calories) -> Maybe (Side,Calories) -> Maybe Meal
calcCals = undefined -- TODO

-- | showMeal:
-- Given an input of Main, an input of Side, and an input of Maybe Side
-- output a String which consists of the Main 
-- followed by a white space and the first Side,
-- then a white space and the second Side if not Nothing.
--
-- Hint: the function 'show' will convert a Main or Side to a String.
-- 
-- Examples:
--
-- >>> showMeal Fish Potato (Just Bread)
-- "Fish Potato Bread"
--
-- >>> showMeal Tofu Salad Nothing
-- "Tofu Salad"
--
showMeal :: Main -> Side -> Maybe Side -> String
showMeal = undefined -- TODO
