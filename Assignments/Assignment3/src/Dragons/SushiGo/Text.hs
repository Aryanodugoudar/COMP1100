{-# LANGUAGE ScopedTypeVariables #-}

{-|
Module      : Dragons.SushiGo.Text
Description : Text interface for the SushiGo game
Copyright   : (c) 2022 The Australian National University
License     : AllRightsReserved
-}
module Dragons.SushiGo.Text where

import Text.Read (readMaybe)
import SushiGo
import Data.Maybe
import Data.List
import Dragons.Game
import Dragons.Game.UI.Text as UI
import ListUtils (counts)
import Dragons.SushiGo ()

-- $overview
--
-- Text UIs for different games have a lot of similar code. This
-- module abstracts over those similarities, so that you can provide
-- only the text handling details for your game, and get a complete UI
-- for it.


-- | Draw a grid of strings.
grid :: [[String]] -> String
grid table = concatMap renderRow table
  where
    renderRow row = "| " ++ intercalate " | " (paddedRow row) ++ " |\n"
    nCols = maximum (map length table)

    columnWidths :: [Int]
    columnWidths = take nCols (foldr merge (repeat 0) table) where
      merge row = zipWith max (map length row ++ repeat 0)

    paddedRow row
      = zipWith padTo columnWidths (row ++ replicate (nCols - length row) "")
    padTo n cell = cell ++ replicate (n - length cell) ' '



renderState :: GameState -> String
renderState state = unlines $ catMaybes
  [ renderTurn (gameStatus state)
  , Just $ renderGame state
  ]

renderTurn :: Turn -> Maybe String
renderTurn t = case t of
  Turn Player1 -> Just "Player 1 to move"
  Turn Player2 -> Just "Player 2 to move"
  GameOver _ -> Nothing

  
renderGame :: GameState -> String
renderGame gs = concat
  [ line
  , header ++ "\n"
  , "\n"
  , "State of Play:\n"
  , "\n"
  , grid (transpose report)
  , "Player 1 Score: " ++ show (scoreCards gs Player1) ++ "\n"
  , "Player 2 Score: " ++ show (scoreCards gs Player2) ++ "\n"
  , line
  ]
  where
    line = replicate 70 '-' ++ "\n"
    header = case gameStatus gs of
      Turn p -> "Current Player: " ++ show p
      GameOver _ -> "Game Over"

    report :: [[String]]
    report =
      map (take maxLength . (++ repeat "")) [p1Hand, p1Cards, p2Hand, p2Cards]

    p1Hand = "P1 (hand)" : renderCount (counts (handFor Player1 gs))
    p1Cards = "P1 (cards)" : renderCount (counts (cardsFor Player1 gs))
    p2Hand = "P2 (hand)" : renderCount (counts (handFor Player2 gs))
    p2Cards = "P2 (cards)" : renderCount (counts (cardsFor Player2 gs))
    maxLength = maximum (map length [p1Hand, p1Cards, p2Hand, p2Cards])

    renderCount = map renderLine . sort
      where renderLine (c, n) = concat [ "  ", show c, "(", show n, ")" ]

 

renderMove :: Move -> String
renderMove  (TakeCard c)= "took card " ++ show c


textUI :: GameConfig GameState Move -> GameUI GameState Move 
textUI config = UI.textUI config $ TextUI
  { textRenderState = renderState
  , textReadMove = readMove
  }

-- | Ask for a move, check that it's sensible, and if it isn't, ask again.
readMove :: GameState -> Maybe (Player, Move) -> IO Move
readMove state _ = loop
  where
    loop = do
      putStrLn $ "Enter a move. Examples: " ++ intercalate ", " (map show hand)++ ". Make sure to have TakeCard before the card. (E.g. TakeCard Tea)"
      line <- getLine
      case parseMove line of
        Nothing -> errLoop "Malformed move, try again."
        Just out@(TakeCard mv)
          | mv `elem` hand -> pure out
          | otherwise -> errLoop "Not a valid move."

    errLoop s = putStrLn s *> loop
    hand = handFor p state 
    -- this is the player
    p = case (gameStatus state) of 
      Turn q -> q 
      _ -> error "readMove: gameOver"


-- Define the moveRender function
parseMove :: String -> Maybe Move
parseMove str = case words strNoBrackets of
  "TakeCard":cardStr -> do
    card <- parseCard cardStr
    return (TakeCard card)
  _ -> Nothing
  where 
    strNoBrackets = map (\x  -> if (elem x "()") then ' ' else x) str

-- Helper function to parse a Card from a string
parseCard :: [String] -> Maybe Card
parseCard str = case str of
  ["Nigiri", intStr] -> Nigiri <$> readMaybe intStr
  ["Wasabi", "Nothing"] -> Just (Wasabi Nothing)
  ["Dumplings"] -> Just Dumplings
  ["Eel"] -> Just Eel
  ["Tofu"] -> Just Tofu
  ["Tempura"] -> Just Tempura
  ["Tea"] -> Just Tea
  ["Temaki"] -> Just Temaki
  _ -> Nothing