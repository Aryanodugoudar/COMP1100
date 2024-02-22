module Greet where

-- Do not edit anything between these lines!
-- ***************************************************************************
data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday

type UNumber = Int
type Name = String
-- ***************************************************************************

-- write the function greet that takes in a 'Weekday', a 'Name', 
-- and a 'UNumber' and returns the following:
--    if the UNumber is smaller or larger than seven digits, or negative
--    return: "UNumber must be a 7 digit positive number."
-- 
--    otherwise if the day is Monday return: "Uggggh."
-- 
--    otherwise return:
--    "Hi! My name is <name> and my student number is U<unumber>!"

-- | Greeting a user.
-- 
-- >>> greet Monday "Donovan" 6881864
-- "Ugggh."
--
-- >>> greet Friday "Donovan" 6881864
-- "Hi! My name is Donovan and my student number is U6881864!"
--
-- >>> greet Wednesday "Donovan" 00000007
-- "UNumber must be a 7 digit positive number."
--
-- >>> greet Wednesday "Donovan" 11111111
-- "UNumber must be a 7 digit positive number."
--
-- >>> greet Tuesday "" 7777777
-- "Hi! My name is  and my student number is U7777777!"

greet :: Weekday -> Name -> UNumber -> String
greet = undefined
