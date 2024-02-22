module SushiGo where

import ListUtils (pick)

-- | The list of possible cards
data Card
  = Nigiri Int
  | Wasabi (Maybe Card)
  | Dumplings
  | Eel
  | Tofu 
  | Tempura
  | Tea
  | Temaki
  deriving (Eq, Ord, Show)


data Move = TakeCard Card
  deriving (Eq, Show)

data Turn
  = Turn Player
  | GameOver Outcome
  deriving (Eq, Show)

data Player = Player1 | Player2 
  deriving (Eq, Show)

otherPlayer :: Player -> Player
otherPlayer player = case player of 
  Player1 -> Player2
  Player2 -> Player1

data Outcome = Winner Player 
            | Draw 
            deriving (Eq, Show)

data GameState = GameState
  Turn -- ^ Whose turn it is, or whether the game is over
  [Card] -- ^ Player 1's hand (cards to select from)
  [Card] -- ^ Player 1's chosen cards
  [Card] -- ^ Player 2's hand
  [Card] -- ^ Player 2's cards
  deriving (Eq, Show)

-- | Set up a game
initialGame
  :: [Card] --  ^ Player 1's hand
  -> [Card] --  ^ Player 2's hand
  -> GameState
initialGame p1h p2h = GameState (Turn Player1) p1h [] p2h []

-- | Get the turn from a game state 
gameStatus :: GameState -> Turn
gameStatus (GameState s _ _ _ _) = s

-- | Get the hand for a given player.
handFor :: Player -> GameState -> [Card]
handFor player (GameState _ p1h _ p2h _) = case player of 
  Player1 -> p1h
  Player2 -> p2h

-- | Replace the hand for a given player.
setHandFor :: Player -> [Card] -> GameState -> GameState
setHandFor player playerHand (GameState st p1h p1c p2h p2c) = case player of 
  Player1 -> GameState st playerHand p1c p2h p2c
  Player2 -> GameState st p1h p1c playerHand p2c

-- | Get the selected cards for a given player.
cardsFor :: Player -> GameState -> [Card]
cardsFor player (GameState _ _ p1c _ p2c) = case player of 
  Player1 -> p1c
  Player2 -> p2c

-- | Replace the selected cards for a given player.
setCardsFor :: Player -> [Card] -> GameState -> GameState
setCardsFor player playerCards (GameState st p1h p1c p2h p2c) = case player of
  Player1 -> GameState st p1h playerCards p2h p2c
  Player2 -> GameState st p1h p1c p2h playerCards


-- | Scores a list of cards
scoreCards :: GameState -> Player -> Int
scoreCards gs currentPlayer = sum
  [ scoreSingleCards -- scores wasabi and nigiri
  , scoreDumplings nDumplings
  , scoreEel nEel
  , scoreTofu nTofu
  , scoreTempura nTempura
  , scoreTea countModified nTea
  , scoreTemaki (nTemaki, length(filter (==Temaki) opponentsCards) )
  ]
  where
    cards = cardsFor currentPlayer gs 
    opponentsCards = cardsFor (otherPlayer currentPlayer) gs
    
    -- counts the number of each card type in the players hand 
    -- this is a helper function defined at the bottom of the file that 
    -- efficiently calculates the sum for each type 
    (nNigiri1, nNigiri2, nNigiri3,nWasabi0,nWasabi1,nWasabi2,nWasabi3,
      nDumplings,nEel,nTofu,nTempura,nTea,nTemaki) = countHelper 
        (0,0,0,0,0,0,0,0,0,0,0,0,0) cards 
     
    --- count for tea: this is modifying the counts above 
    --- so that wasabi with nigiri counts for both the wasabi and the nigiri
    countModified = [nNigiri1 + nWasabi1, nNigiri2 + nWasabi2, 
      nNigiri3 + nWasabi3,  nWasabi0+ nWasabi1+ nWasabi2 + nWasabi3,
      nDumplings,nEel,nTofu,nTempura,nTea,nTemaki]

    -- scores wasabi and nigiri
    scoreSingleCards = sum (flip map cards
      (\card -> case card of
          Nigiri n -> n
          Wasabi (Just (Nigiri n)) -> n * 3
          -- Technically redundant, but we spell it out so every card
          -- type is named in the scoring function.
          _ -> 0))

    scoreDumplings n
      | n == 0 = 0
      | n == 1 = 1
      | n == 2 = 3
      | n == 3 = 6
      | n == 4 = 10
      | n >= 5 = 15
      | otherwise = error "scoreDumplings: negative Dumpling count?"

    scoreEel n
      | n == 0 = 0
      | n == 1 = -3
      | n >= 2 = 7
      | otherwise = error "scoreEel: negative Eel count?"

    scoreTofu n
      | n == 0 = 0
      | n == 1 = 2
      | n == 2 = 6
      | n >= 3 = 0
      | otherwise = error "scoreTofu: negative Tofu count?"

    scoreTempura n = (n `div` 2) * 5
    
    scoreTea ns teaCardCount= teaCardCount*(maximum ns)

    scoreTemaki (curT, oppT) 
      |curT == oppT = 0
      |curT > oppT = 4
      |otherwise = -4 


-- Who is ahead right now? Return 'Nothing' if scores are tied.
playerAhead :: GameState -> Maybe Player
playerAhead gs
  | score1 < score2 = Just Player2
  | score1 == score2 = Nothing
  | otherwise = Just Player1
  where 
    score1 = scoreCards gs Player1
    score2 = scoreCards gs Player2

-- Outcome of the game 
getOutcome :: GameState -> Outcome
getOutcome gs
  | score1 == score2 = Draw
  | score1 > score2 = Winner Player1
  | otherwise = Winner Player2
  where
    score1 = scoreCards gs Player1
    score2 = scoreCards gs Player2
    
-- | Applies the move to a game state, and gives the resultant gameState
playMove :: Move -> GameState -> Maybe GameState
playMove m s = case gameStatus s of
  GameOver _ -> Nothing --error "playMove: move played against finished game"
  Turn p -> Just $ updateStatus (swapHandsMaybe (runMoveFor p s))
    where
      -- | Move cards from a player's hand to their cards.
      runMoveFor :: Player -> GameState -> GameState
      runMoveFor Player1 (GameState st p1h p1c p2h p2c)
        = GameState st p1h' p1c' p2h p2c
        where (p1h', p1c') = runMove m p1h p1c

      runMoveFor Player2 (GameState st p1h p1c p2h p2c)
        = GameState st p1h p1c p2h' p2c'
        where (p2h', p2c') = runMove m p2h p2c

      -- | Construct the new hand/card pair from the old hand/cards and
      -- | move to make.
      runMove :: Move -> [Card] -> [Card] -> ([Card], [Card])
      runMove (TakeCard c) hand cards = pickCard c hand cards

      -- | If player 2 just had their turn, we need to swap hands for
      -- | the next round.
      swapHandsMaybe :: GameState -> GameState
      swapHandsMaybe gs@(GameState st p1h p1c p2h p2c)
        = case p of
            Player1 -> gs
            Player2 -> (GameState st p2h p1c p1h p2c)

      -- | Decide who is to go next, or whether the game is over.
      updateStatus :: GameState -> GameState
      updateStatus gs@(GameState _ p1h p1c p2h p2c) = GameState s' p1h p1c p2h p2c
        where s' = case (p1h, p2h) of
                     ([], []) -> GameOver (getOutcome gs)
                     _ -> Turn (otherPlayer p)

-- | Pick one card from a hand, attaching Nigiri to any free Wasabi.
pickCard :: Card -> [Card] -> [Card] -> ([Card], [Card])
pickCard c hand cards = case pick c hand of
  Nothing -> error (concat
                     [ "pickCard: card "
                     , show c
                     , " not in hand "
                     , show hand
                     ])
  Just hand' -> case (c, pick (Wasabi Nothing) cards) of
    (Nigiri _, Just cards') -> (hand', Wasabi (Just c) : cards')
    _ -> (hand', c:cards)

-- this is an efficient way to count the number of cards in each type
-- it will traverse through the list once and increment the count of the
-- respective index in the tuple
type CardTuple = (Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int)

countHelper ::  CardTuple -> [Card] -> CardTuple
countHelper tuple cards = case cards of 
        [] -> tuple 
        x:xs -> countHelper (incrementTuple tuple indexOfx) xs
          where 
            -- this identifies which card x is 
            indexOfx :: Int 
            indexOfx  = (length (takeWhile (/= x) listOfCards))+1

            -- list of all possible cards
            listOfCards:: [Card]
            listOfCards = [Nigiri 1,Nigiri 2, Nigiri 3,Wasabi Nothing, 
                  Wasabi (Just (Nigiri 1)),Wasabi (Just (Nigiri 2)), 
                  Wasabi (Just (Nigiri 3)),Dumplings,Eel,Tofu
                  ,Tempura,Tea,Temaki]

            -- this will increment the respective index only
            inc :: Int -> Int -> Int 
            inc index currInd = if index==currInd then 1 else 0

            -- increments the correct part of the tuple
            incrementTuple :: CardTuple -> Int -> CardTuple
            incrementTuple  (nNigiri1, nNigiri2, nNigiri3,
              nWasabi0,nWasabi1,nWasabi2,nWasabi3,
              nDumplings,nEel,nTofu,nTempura,nTea,nTemaki) n =
                (nNigiri1  + inc n 1, nNigiri2 + inc n 2, nNigiri3 + inc n 3,
                nWasabi0 + inc n 4, nWasabi1 + inc n 5,nWasabi2 + inc n 6,
                nWasabi3 + inc n 7, nDumplings + inc n 8,nEel + inc n 9, nTofu + 
                inc n 10,nTempura + inc n 11,nTea + inc n 12,nTemaki + inc n 13)
