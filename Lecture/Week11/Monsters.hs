module Monsters where

-- **This file is for COMP1100 STUDENTS ONLY**
-- **Do NOT attempt if you are a COMP1130 Student**

-- There are two functions to complete in this file
-- It is NOT necessary to complete the first to attempt the second

-- Type declarations for 'Monsters'
-- DO NOT EDIT OR DELETE THESE
-- (You may add 'deriving' clauses)
-- Each Monster has a Name, and 1 or 2 'Kinds'

type Name = String

data Kind = Grass | Fire | Water
  deriving Show

data Monster = Monster Name Kind (Maybe Kind)
  deriving Show

-- | isFire:
-- Given a Monster,
-- return True if either (or both) of the Monster's Kinds are Fire
--
-- Examples:
--
-- >>> isFire (Monster "Charzamper" Fire Nothing)
-- True
--
-- >>> isFire (Monster "Scomotion" Fire (Just Grass))
-- True
--
-- >>> isFire (Monster "Scomotion" Grass (Just Fire))
-- True

isFire :: Monster -> Bool
isFire (Monster _ kind mKind) = case (kind,mKind) of
  (Fire,_)      -> True
  (_,Just Fire) -> True
  _             -> False

-- | noKindRepeats:
-- Given a Monster,
-- if it has two Kinds that are the same,
-- return a Monster of the same name with that Kind only once
-- Otherwise return the original Monster unchanged.
--
-- Examples:
--
-- >>> noKindRepeats (Monster "Warsquirtle" Water (Just Water))
-- Monster "Warsquirtle" Water Nothing
--
-- >>> noKindRepeats (Monster "Warsquirtle" Water Nothing)
-- Monster "Warsquirtle" Water Nothing
--
-- >>> noKindRepeats (Monster "Ludicrosity" Grass (Just Water))
-- Monster "Ludicrosity" Grass (Just Water)

noKindRepeats :: Monster -> Monster
noKindRepeats m@(Monster name kind mKind) = case (kind,mKind) of
  (Grass,Just Grass) -> Monster name Grass Nothing
  (Fire,Just Fire)   -> Monster name Fire Nothing
  (Water,Just Water) -> Monster name Water Nothing
  _                  -> m