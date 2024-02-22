module DietaryMessage where

-- The DietaryRequirement type lists some possible Dietary Requirements.
-- In the case of an Allergy, a String argument records the specific food.
-- DO NOT edit or delete this type declaration.

data DietaryRequirement
  = Halal
  | Kosher
  | Vegan
  | Vegetarian
  | Allergy String

-- | dietaryMessage:
-- Given an input of type DietaryRequirement,
-- return a String communicating that requirement,
-- *exactly* according to the following specification:
-- - For Halal, "Halal food only"
-- - For Kosher, "Kosher food only"
-- - For Vegan, "No animal products"
-- - For Vegetarian, "No meat"
-- - For an Allergy, the word "No" followed by a space, followed by the food.
-- Note that any deviation from the Strings above,
-- e.g. misspellings or incorrect capitalisations,
-- will cause some of your tests to fail.
--
-- Hint: the Prelude provides the function
-- (++) : String -> String -> String
-- which appends two Strings together.
-- (++) is usually written infix (between its arguments)
-- and without the parentheses, e.g. "hello " ++ "world"
--
-- Examples:
--
-- >>> dietaryMessage Halal
-- "Halal food only"
--
-- >>> dietaryMessage (Allergy "shellfish")
-- "No shellfish"

dietaryMessage :: DietaryRequirement -> String
dietaryMessage a = case a of
  Halal-> "Halal food only"
  Kosher-> "Kosher food only"
  Vegan-> "No animal products"
  Vegetarian->"No meat"
  Allergy p -> "No " ++ p