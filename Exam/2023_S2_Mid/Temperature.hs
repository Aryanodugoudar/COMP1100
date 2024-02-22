module Temperature where

-- DO NOT REMOVE OR EDIT THE CODE BETWEEN THE LINES
--------------------------------------------------------------------------------

type Celsius = Int
data Temperature = Impossible | Negative Int | ExactlyZero | Positive Int
  deriving (Eq, Show)

--------------------------------------------------------------------------------

-- | 'whatTemp' has as input a value of type Celsius and outputs a
-- value of type Temperature. The type Temperature is defined above.
-- If the input is (strictly) below -273 then it returns 'Impossible'.
-- Otherwise, if it is (strictly) below 0 it returns 'Negative x',
-- where x is the absolute value of the input.
-- If the input is 0 then 'whatTemp' outputs 'ExactlyZero'.
-- If the input is (strictly) above 0 degrees Celsius, then the output
-- should be 'Positive x', where x is the input.
--
-- Example:
--
-- >>> whatTemp (-300)
-- Impossible
--
-- >>> whatTemp (-30)
-- Negative 30
--
-- >>> whatTemp 30
-- Positive 30

whatTemp :: Celsius -> Temperature
whatTemp x
  |x<(-273) = Impossible
  |x>=(-273) && x<0 = Negative (x*(-1))
  |x==0 = ExactlyZero
  |x>0 = Positive x