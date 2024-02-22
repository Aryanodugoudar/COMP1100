module AI where

import SushiGo

import Data.List (maximumBy)
import Data.Function (on)


-- | Type of AI functions you can choose to write.
data AI
  = NoLookahead (GameState -> Move)
    -- ^ Simple AIs that do not need lookahead.
  | WithLookahead (GameState -> Int -> Move)
    -- ^ AIs that want to look ahead. The assignment framework will
    -- call the function over and over with increasing integer
    -- arguments @1, 2, 3, ...@ until your AI's time limit is up.


-- | The table of all AIs you have implemented. We will mark the AI
-- called "default" as your submission, but you may include other AIs
-- for testing.



ais :: [(String, AI)]
ais = [ ("first", NoLookahead firstLegal)
      , ("greedy", NoLookahead aiGreedy)
      , ("default", WithLookahead aiMinimax)
      ]


firstLegal :: GameState -> Move
firstLegal state = case gameStatus state of
  Turn player -> TakeCard (head (handFor player state))
  _ -> error "firstLegal: called on finished game"

-- Heuristic function to evaluate a game state
evaluateGameState :: GameState -> Int
evaluateGameState gs = (playerScore - opponentScore) + (playerHandSize - opponentHandSize)
  where
      currentPlayer = case gameStatus gs of
                        Turn player -> player
                        _ -> error "evaluateGameState: called on finished game"
      opponent = otherPlayer currentPlayer
      playerScore = scoreCards gs currentPlayer
      opponentScore = scoreCards gs opponent
      playerHandSize = length (handFor currentPlayer gs)
      opponentHandSize = length (handFor opponent gs)


-- Greedy AI function
greedyMove :: GameState -> Move
greedyMove gs =
  let currentPlayer = case gameStatus gs of
                        Turn player -> player
                        _ -> error "greedyMove: called on finished game"
      possibleMoves = generatePossibleMoves currentPlayer gs
      scoredMoves = [(move, evaluateMove gs move 0) | move <- possibleMoves]
      bestMove = maximumBy (compare `on` snd) scoredMoves
  in fst bestMove


-- Helper function to evaluate a move
evaluateMove :: GameState -> Move -> Int -> Int
evaluateMove gs move acc = case playMove move gs of
    Just newState -> acc + scoreDifference gs newState
    Nothing -> acc

-- Helper function to generate all possible moves for a player
generatePossibleMoves :: Player -> GameState -> [Move]
generatePossibleMoves player gs = case gameStatus gs of
  Turn currentPlayer ->
    let hand = handFor player gs
        validMoves = map TakeCard hand
    in validMoves
  _ -> []


-- NoLookahead Minimax-based AI function
aiGreedy :: GameState -> Move
aiGreedy gs = greedyMove gs


-- Minimax AI function
minimaxMove :: GameState -> Int -> Move
minimaxMove gs depth = fst bestMove
  where
      aiPlayer = getCurrentPlayer gs
      possibleMoves = generatePossibleMoves aiPlayer gs
      scoredMoves = [(move,  minimax gs move depth aiPlayer) | move <- possibleMoves]
      bestMove =  maximumBy (compare `on` snd) scoredMoves


-- Algo for Minimax AI 
minimax :: GameState -> Move -> Int -> Player-> Int
minimax gs move depth aiPlayer
  | depth == 0 || isGameOver gs = evaluateGameState gs
  | getCurrentPlayer gs == aiPlayer = maxEval
  | otherwise = minEval
    where
        newState = case playMove move gs of
                     Just s -> s
                     Nothing -> gs
        oppPlayer = otherPlayer aiPlayer
        possibleMoves = generatePossibleMoves oppPlayer newState
        maxEval = foldl (\acc m -> max acc (minimax newState m (depth - 1) aiPlayer)) (-1000) possibleMoves
        possibleMovesai = generatePossibleMoves aiPlayer newState
        minEval = foldl (\acc m -> min acc (minimax newState m (depth - 1) aiPlayer)) 1000 possibleMovesai


getCurrentPlayer :: GameState -> Player 
getCurrentPlayer state = case gameStatus state of 
  Turn player -> player
  _           -> error "getCurrentPlayer: Called on terminated game !"

-- Helper function to check if the game is over
isGameOver :: GameState -> Bool
isGameOver (GameState (GameOver _) _ _ _ _) = True
isGameOver _ = False


-- WithLookahead Minimax-based AI function
aiMinimax :: GameState -> Int -> Move
aiMinimax gs depth = minimaxMove gs depth


-- Helper function to evaluate the score difference between two game states
scoreDifference :: GameState -> GameState -> Int
scoreDifference gs1 gs2 = scoreCards gs2 Player1 - scoreCards gs1 Player1

