module OddsOverEvens where

-- | oddsOverEvens:
-- Given an Integer greater than or equal to 2 as input, return
-- the product of all odd positive integers up to and including the input,
-- divided by
-- the product of all even positive integers up to and including the input.
--
-- For example,
-- oddsOverEvens 6 = (1 * 3 * 5) / (2 * 4 * 6)
--
-- If the input is 1 or smaller, return 1.
--
-- Hints:
-- The Prelude function fromIntegral can convert an Integer to a Double;
-- The Prelude functions odd and even can test whether an Integer is odd or even
-- 
-- Examples:
--
-- >>> oddsOverEvens 1
-- 1.0
--
-- >>> oddsOverEvens 2
-- 0.5
--
-- >>> oddsOverEvens 3
-- 1.5


oddsOverEvens :: Integer -> Double
oddsOverEvens n
    | n <= 1 = 1.0
    | otherwise = fromIntegral (product odds) / fromIntegral (product evens)
  where
    odds = [1, 3 .. n]
    evens = [2, 4 .. n]


foo :: Double -> String -> Int
foo x = x