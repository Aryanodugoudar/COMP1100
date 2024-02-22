module Eyes where

-- DO NOT REMOVE OR EDIT THE CODE BETWEEN THE LINES
--------------------------------------------------------------------------------

data Animal = Cat | Worm | Spider Int | Tuatara
    deriving (Eq, Show)

--------------------------------------------------------------------------------

-- | We consider four animals, cats, worms, spiders and Tuatara.
-- (A tuatara is a reptile that can be found in New Zealand.)
-- Cats have 2 eyes, worms have no eyes, and tuatara have 3 eyes.
-- The number of eyes spiders have varies, so the constructor Spider in the
-- type Animal above has an argument Int, denoting the number of eyes.
-- Write a function that takes an animal as input and returns the
-- number of eyes of the animal.
--
-- Examples:
--
-- >>> eyes Cat
-- 2
--
-- >>> eyes (Spider 8)
-- 8

eyes :: Animal -> Int
eyes x = case x of
    Cat ->2
    Worm ->0
    Tuatara-> 3
    Spider p -> p