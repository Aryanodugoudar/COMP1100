{-# OPTIONS_GHC -Wno-orphans #-}

{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

{-|
Module      : Dragons.SushiGo
Description : SushiGo-specific things students don't need to see
Copyright   : (c) 2023 The Australian National University
License     : AllRightsReserved

This module collects functions and instances for SushiGo-specific data
structures (so they don't belong in the generic game framework), but
are also implementation details that students don't need to concern
themselves with.
-}
module Dragons.SushiGo where

import AI
import SushiGo as SG
import Data.Aeson
import Dragons.Game
import System.Random (mkStdGen, randomRs)
import Data.Time.Clock.POSIX

-- | This is the number of cards for each type of card
defaultTable :: [(Int, Card)]
defaultTable =
      [ (5, Nigiri 1)
      , (5, Nigiri 2)
      , (5, Nigiri 3)
      , (8, Wasabi Nothing)
      , (8, Dumplings)
      , (8, Eel)
      , (8, Tofu)
      , (8, Tempura)
      , (8, Tea)
      , (8, Temaki)
      ]

{-
Purpose: Generates a tuple with the initial hand for both Player 1 and 2 
Input: A potential seed
Returns: A tuple with shuffled hands for both players. 
-}
genInitialHand :: Int -> IO ([Card],[Card])
genInitialHand n = do
      seed <- getSeed n
      let 
        handSize = 20
        shuffledDeck = genFromTable seed defaultTable
        firstHand = take handSize shuffledDeck
        secondHand =  take handSize (drop handSize shuffledDeck)
      return (firstHand, secondHand)

-- Generates a random integer when no seed is provided 
getSeed :: Int -> IO Int
getSeed n
  | n == notPossibleSeed = do
        m <- round `fmap` (*100) `fmap` getPOSIXTime
        return (mod m 103)
  | otherwise = return n
    
-- Given a random variable, and a list of cards and counts
-- It will return a shuffled deck of cards     
genFromTable :: Int -> [(Int, a)] -> [a]
genFromTable maybeSeed table = 
  let
    gen = mkStdGen maybeSeed
    limit = sum (map fst table)
    m = randomRs (0, 1000) gen
    final = zipWith mod m (reverse [1..(limit-1)])
  in
    selectWithOutReplacement final table
  where 
    -- This takes a list of indices, a list with frequencies and cards and 
    -- output the cards relevant to the given indices
    -- Note: each time a card is taken the card will be removed from the list 
    -- So that we have the same number of cards 
    selectWithOutReplacement:: [Int] -> [(Int,a)] -> [a]
    selectWithOutReplacement list cards =  helper list (cards,[]) []
      where 
          helper :: [Int] -> ([(Int,a)],[(Int,a)]) -> [a] -> [a]
          helper [] _ acc = acc
          helper (x:xs) ((freq, a):as, checked) acc
              | x > freq = helper ((x - freq):xs) (as,(freq, a):checked) acc
              | otherwise = helper xs (checked ++ ((freq-1,a):as),[]) (a:acc)
          helper _ ([],_) _ = error "table exhausted"

-- This is a seed that is not valid (it will generate random numbers)
notPossibleSeed :: Int 
notPossibleSeed  = -9223372036854775808

toAITable :: [(String, AI)] -> [(String, GenericAI GameState Move)]
toAITable = (fmap . fmap) toGenericAI
  where
    toGenericAI :: AI -> GenericAI GameState Move
    toGenericAI aiFunc st = case aiFunc of
      NoLookahead f -> [f st]
      WithLookahead f -> map (f st) [1..]

-- Setting up the rules for a game; COMP1100
rules1100 :: Int -> IO (GameRules GameState Move)
rules1100 n  = do
  (hand1, hand2) <- genInitialHand n
  return GameRules
    { gameInitialState = initialGame hand1 hand2 -- We need to change this to take a seed in Dragons.Game
    , gameGetTurn = gameStatus
    , gameApplyMove = playMove
    }

------------------------------------------------------------------------------
-- fromJSON and toJSON for the new data types
-----------------------------------------------------------------------------
-- How to turn move types to and from JSON. Best practice is
-- to define instances next to either the data type or the
-- typeclass. These are "orphan" instances, and normally poor
-- practice, but we don't want to have too much mysterious code in
-- files that students need to read.

-- Define instances for JSON serialization and deserialization
instance ToJSON Card where
  toJSON (Nigiri n) = object ["type" .= ("Nigiri" :: String), "value" .= n]
  toJSON (Wasabi mc) = object ["type" .= ("Wasabi" :: String), "card" .= mc]
  toJSON Dumplings = object ["type" .= ("Dumplings" :: String)]
  toJSON Eel = object ["type" .= ("Eel" :: String)]
  toJSON Tofu = object ["type" .= ("Tofu" :: String)]
  toJSON Tempura = object ["type" .= ("Tempura" :: String)]
  toJSON Tea = object ["type" .= ("Tea" :: String)]
  toJSON Temaki = object ["type" .= ("Temaki" :: String)]

instance FromJSON Card where
  parseJSON = withObject "Card" $ \obj -> do
    cardType <- obj .: "type"
    case (cardType :: String) of
      "Nigiri" -> Nigiri <$> obj .: "value"
      "Wasabi" -> Wasabi <$> obj .: "card"
      "Dumplings" -> pure Dumplings
      "Eel" -> pure Eel
      "Tofu" -> pure Tofu
      "Tempura" -> pure Tempura
      "Tea" -> pure Tea
      "Temaki" -> pure Temaki
      _ -> fail "Unknown card type"


instance FromJSON Move where
  parseJSON = withObject "Move" $ \obj -> do
    moveType <- obj .: "type"
    case (moveType :: String) of
      "TakeCard" -> TakeCard <$> obj .: "card"
      _ -> fail "Unknown move type"


instance ToJSON Move where
  toJSON (TakeCard card) = object ["type" .= ("TakeCard" :: String), "card" .= card]


instance ToJSON GameState where
  toJSON (GameState t p1h p1 p2h p2) = object
    [ "turn" .= t
    , "player 1 hand" .= p1h
    , "player 1 cards" .= p1
    , "player 2 hand" .= p2h
    , "player 2 cards" .= p2
    ]

