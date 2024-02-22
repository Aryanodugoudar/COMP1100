module ChessHeuristic where

-- Do not edit anything between the lines.
------------------------------------------------------------------------------
data Colour = Black | White

data Piece = Pawn | Rook | Knight | Bishop | Queen | King

pieceValue :: Piece -> Int
pieceValue p =
  case p of
    Pawn -> 1
    Rook -> 5
    Queen -> 9
    King -> 10000
    _ -> 3

-- A list of lists to represent the 2D nature of a chess board.
-- We can think of this as a list of length 8 whose lists are
-- all also of length 8. 
type GameState = [[Maybe (Piece, Colour)]]
------------------------------------------------------------------------------

-- an initial board provided for testing:
initial :: GameState
initial = 
  [[Just (Rook, Black), Just (Bishop, Black), Just (Knight, Black),
    Just (King, Black), Just (Queen, Black), Just (Knight, Black),
    Just (Bishop, Black), Just (Rook, Black)],
   [Just (Pawn, Black), Just (Pawn, Black), Just (Pawn, Black),
    Just (Pawn, Black), Just (Pawn, Black), Just (Pawn, Black),
    Just (Pawn, Black), Just (Pawn, Black)],
   [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing], 
   [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing], 
   [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing], 
   [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing], 
   [Just (Rook, White), Just (Bishop, White), Just (Knight, White),
    Just (King, White), Just (Queen, White), Just (Knight, White),
    Just (Bishop, White), Just (Rook, White)],
   [Just (Pawn, White), Just (Pawn, White), Just (Pawn, White),
    Just (Pawn, White), Just (Pawn, White), Just (Pawn, White),
     Just (Pawn, White), Just (Pawn, White)]
  ]

-- A partial board with only white pieces and no black pieces.
-- Provided for testing.
justWhite :: GameState
justWhite =
  [[Just (Rook, White), Just (Bishop, White), Just (Knight, White),
    Just (King, White), Just (Queen, White), Just (Knight, White),
    Just (Bishop, White), Just (Rook, White)],
   [Just (Pawn, White), Just (Pawn, White), Just (Pawn, White),
    Just (Pawn, White), Just (Pawn, White), Just (Pawn, White),
     Just (Pawn, White), Just (Pawn, White)]
  ]

-- A partial board with only black pieces and no white pieces.
-- Provided for testing.
justBlack :: GameState
justBlack =
  [[Just (Rook, Black), Just (Bishop, Black), Just (Knight, Black),
    Just (King, Black), Just (Queen, Black), Just (Knight, Black),
    Just (Bishop, Black), Just (Rook, Black)],
   [Just (Pawn, Black), Just (Pawn, Black), Just (Pawn, Black),
    Just (Pawn, Black), Just (Pawn, Black), Just (Pawn, Black),
     Just (Pawn, Black), Just (Pawn, Black)]
  ]

-- A partial board with two kings and a white pawn.
-- Provided for testing.
twoKingsAndAPawn :: GameState
twoKingsAndAPawn = [[Nothing, Just (King, White), Nothing,
                     Just (King, Black), Nothing, Nothing,
                     Just (Pawn, White), Nothing]]

-- write a function 'heuristic' that calculates the heuristic of the
-- entire chess board based on the sum of the value of the existing pieces.
-- add the piece if the player is white, subtract the piece if the player is
-- black.
-- A board is better for white if its heuristic is larger.

-- | A heuristic to value White's chessboard state.
--
-- >>> heuristic initial
-- 0
--
-- >>> heuristic []
-- 0
--
-- >>> heuristic justWhite
-- 10039
--
-- >>> heuristic justBlack
-- -10039
--
-- >>> heuristic twoKingsAndAPawn
-- 1

heuristic :: GameState -> Int
heuristic (Just x,y) = sum x
  |y== Black = (Just (-x),y)
  |otherwise = (Just x,y)
