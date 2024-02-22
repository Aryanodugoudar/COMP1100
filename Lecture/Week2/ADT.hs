module ADT where

data Singleton = LonelyElement
  deriving Show

lonelyToZero :: Singleton -> Int
lonelyToZero LonelyElement = 0

-- The underscore in the next functions prevents the
-- "unused variable" warning
allToLonely :: Int -> Singleton
allToLonely _ = LonelyElement


data IntPlusBool = First Int | Second Bool
  deriving Show

leftInj :: Int -> IntPlusBool
leftInj n = First n

toInt :: IntPlusBool -> Maybe Int
toInt (First n) = Just n
toInt (Second _) = Nothing

-- First way of defining product types
type IntAndBool = (Int, Bool)

myFst :: IntAndBool -> Int
myFst (n, _) = n

-- Second way of defining product types
data IntAndBool' = Combine Int Bool

myFst' :: IntAndBool' -> Int
myFst' (Combine n _) = n
