{-|
Module      : AITests
Description : Tests for your AI functions
Copyright   : (c) 2020 Your Name Here
License     : AllRightsReserved
-}
module AITests where


-- | potentially useful imports, please feel free to uncomment
import           AI
import           SushiGo
import           Testing



-- Helper function to create a game state with specific hands for both players
createGameState :: [Card] -> [Card] -> GameState
createGameState p1Hand p2Hand = initialGame p1Hand p2Hand

-- Test cases evaluateGameState function
evaluateGameStateTests :: Test
evaluateGameStateTests = TestGroup "evaluateGameState"
  [ Test "Player1 wins with higher score and fewer cards" $
      assertEqual (evaluateGameState (createGameState [Nigiri 3, Nigiri 2] [Nigiri 1])) 1
  , Test "Player2 wins with higher score and fewer cards" $
      assertEqual (evaluateGameState (createGameState [Nigiri 1] [Nigiri 3, Nigiri 2])) (-1)
  , Test "Player1 wins with higher score and equal number of cards" $
      assertEqual (evaluateGameState (createGameState [Nigiri 3, Nigiri 2] [Nigiri 2, Nigiri 3])) 0
  , Test "Player2 wins with higher score and equal number of cards" $
      assertEqual (evaluateGameState (createGameState [Nigiri 2, Nigiri 3] [Nigiri 3, Nigiri 2])) (0)
  , Test "Draw with equal score and equal number of cards" $
      assertEqual (evaluateGameState (createGameState [Nigiri 1, Nigiri 2] [Nigiri 1, Nigiri 2])) 0
  ]

-- Test cases for greedyMove function
greedyMoveTests :: Test
greedyMoveTests = TestGroup "greedyMove"
  [ Test "Greedy move selects card with higher immediate advantage for Player1" $
      assertEqual (greedyMove (createGameState [Nigiri 3, Nigiri 2, Nigiri 1] [Nigiri 1, Nigiri 2, Nigiri 3])) (TakeCard (Nigiri 3))
  , Test "Greedy move selects card with higher immediate advantage for Player2" $
      assertEqual (greedyMove (createGameState [Nigiri 1, Nigiri 2, Nigiri 3] [Nigiri 3, Nigiri 2, Nigiri 1])) (TakeCard (Nigiri 3))
  , Test "Greedy move selects Dumplings for Player1 to maximize score" $
      assertEqual (greedyMove (createGameState [Dumplings, Dumplings] [Dumplings, Nigiri 3])) (TakeCard Dumplings)
  , Test "Greedy move selects Nigiri for Player2 to maximize score" $
      assertEqual (greedyMove (createGameState [Nigiri 1, Nigiri 2] [Tofu, Tofu, Tofu])) (TakeCard (Nigiri 2) )
  ]

-- Test cases for Minimax function
minimaxTests :: Test
minimaxTests = TestGroup "minimax"
  [ Test "Minimax selects card with maximum advantage for Player1" $
      assertEqual (minimax (createGameState [Nigiri 3, Nigiri 2] [Nigiri 1]) (TakeCard (Nigiri 3)) 3 Player1) 1000
  , Test "Minimax selects Dumplings for Player1 to maximize score" $
      assertEqual (minimax (createGameState [Dumplings, Dumplings] [Dumplings, Nigiri 3]) (TakeCard Dumplings) 3 Player1) 1
  , Test "Minimax selects Nigiri for Player2 to maximize score" $
      assertEqual (minimax (createGameState [Nigiri 1, Nigiri 2] [Tofu, Tofu, Tofu]) (TakeCard (Nigiri 2)) 3 Player2) (-2)
  , Test "Minimax handles deeper search for Player1" $
      assertEqual (minimax (createGameState [Dumplings, Dumplings] [Dumplings, Nigiri 3]) (TakeCard Dumplings) 5 Player1) 1000
  , Test "Minimax handles deeper search for Player2" $
      assertEqual (minimax (createGameState [Nigiri 1, Nigiri 2] [Tofu, Tofu, Tofu]) (TakeCard (Nigiri 2)) 5 Player2) (-1000)
  , Test "Minimax handles game termination for Player1" $
      assertEqual (minimax (createGameState [Dumplings, Dumplings, Dumplings] [Dumplings, Dumplings, Dumplings]) (TakeCard Dumplings) 3 Player1) (-1)
  , Test "Minimax handles game termination for Player2" $
      assertEqual (minimax (createGameState [Nigiri 1, Nigiri 2, Nigiri 3] [Nigiri 1, Nigiri 2, Nigiri 3]) (TakeCard (Nigiri 3)) 3 Player2) (-3)
  ]



-- Test all AI functions
aiTests :: Test
aiTests = TestGroup "AI"
  [ evaluateGameStateTests
  , greedyMoveTests
  , minimaxTests
  ]


