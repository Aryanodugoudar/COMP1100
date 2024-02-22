module Rock where
-- Rock paper scissors is a game in which each player simultaneously forms one of three shapes; Rock, Paper, and Scissors. 
-- Rock beats Scissors, Scissors beats Paper and Paper beats Rock. 
-- If two players choose the same move, the outcome is a draw.

type Name = String

-- There are three available moves, Rock, Paper and Scissors.
data Move = Rock | Paper | Scissors deriving (Show, Eq)

data Outcome = Win | Draw | Lose deriving (Show, Eq)
-- Players have names and associated moves.
data Player = P Name Move deriving Show

-- | nameOf:
-- Given an input of type Player,
-- return the name of Player.
-- 
-- Examples:
-- >>> nameOf (P "Allie" Rock)
-- "Allie"
--
-- >>> nameOf (P "Bob" Paper)
-- "Bob"
nameOf = undefined --TODO

-- | play:
-- Given two Players as input, 
-- return the outcome of the first player. 
--
-- Examples:
-- >>> play (P "Allie" Rock) (P "Jack" Paper) 
-- Lose
--
-- >>> play (P "Ben" Paper) (P "Bob" Paper)
-- Draw
play = undefined --TODO

-- | winner:
-- Given two Players as input, 
-- return the name of the winning Player.
-- Return Nothing if no one wins.
-- 
-- Note that it is useful to complete play and nameOf before you attempt this question.
--
-- Examples:
-- >>> winner (P "Allie" Rock) (P "Jack" Paper) 
-- Just "Jack"
--
-- >>> winner (P "Ben" Paper) (P "Bob" Paper)
-- Nothing
winner = undefined --TODO
    
