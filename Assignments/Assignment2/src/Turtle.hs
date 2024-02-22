module Turtle where

import CodeWorld


type Radians = Double

-- | The commands that we can send to our turtle.
data TurtleCommand
  = Forward -- ^ Drive forward one step,
                   -- drawing if the pen is down.
  | Turn Radians -- ^ Turn the turtle. Positive values are
                 -- anticlockwise; negative values are clockwise.
  | PenUp -- ^ Lift the pen, so that future 'Forward' instructions do
          -- not draw.
  | PenDown -- ^ Lower the pen, so that future 'Forward' instructions
            -- will draw.
  | ChangeSize Double -- ^ Increase the step size by a given double
  deriving (Eq, Show)

-- Task 1: Drawing Shapes

triangle :: Double -> [TurtleCommand]
triangle l
  | l <= 0 = error "Perimeter cannot be 0 or negative"
  | otherwise = [
      ChangeSize (-1),
      PenDown, 
      ChangeSize (l / 3), 
      Turn (-pi / 6), 
      Forward, 
      Turn (-2*pi / 3), 
      Forward, 
      Turn (-2*pi/3), 
      Forward,
      Turn(pi/2),
      PenUp 
    ]


polygon :: Int -> Double -> [TurtleCommand]
polygon n p
  | n < 3 = error "Polygon should have at least 3 sides"
  | p <=0 = error "Perimeter cannot be 0 or negative"
  | otherwise = 
    let sideLength = p / fromIntegral n
        angle = -2 * pi / fromIntegral n
        drawOne= [ChangeSize (-1)]
        drawSide = [PenDown,ChangeSize (sideLength), Turn angle, Forward,ChangeSize (-sideLength) , PenUp]
        polygon' 1 = drawSide
        polygon' m = drawSide ++ polygon' (m-1)
    in drawOne ++ polygon' (n - 1) ++drawSide


-- Task 2: Interpreting Turtle Commands

data PenStatus = MyPenUp | MyPenDown deriving (Eq, Show)

data TurtleState
  =Turtle Point Radians TurtleCommand PenStatus Double 
                                                
  deriving (Eq, Show)

initialState :: TurtleState
initialState = Turtle (0,0) (pi/2) PenDown MyPenDown 1.0


-- | Interprets a list of Turtle commands and produces a Picture.
runTurtle :: [TurtleCommand] -> Picture
runTurtle command= stateToPic (comToState command initialState)



-- | Changes the list of commands to the list of TurtleStates
comToState :: [TurtleCommand]-> TurtleState-> [TurtleState]
comToState l (Turtle (a,b) ir tc ud cz) = case l of
    [] -> []
    PenDown : xs -> [Turtle (a,b) ir PenDown MyPenDown cz]++(comToState xs (Turtle (a,b) ir tc MyPenDown cz))
    PenUp : xs -> [Turtle (a,b) ir PenUp MyPenUp cz] ++ (comToState xs (Turtle (a,b) ir tc MyPenUp cz))
    Forward: xs->[Turtle (a,b) ir (Forward) ud cz]++ (comToState xs (Turtle (newX,newY) ir (Forward) ud cz))
            where newX = (a+cz* (cos ir))
                  newY = (b+cz*(sin ir))
    Turn r : xs -> [Turtle (a,b) (nr) (Turn (nr)) ud cz] ++ (comToState xs (Turtle (a,b) (nr) (Turn (nr)) ud cz))
            where nr = r+ir
      
    ChangeSize d :xs -> [Turtle (a,b) ir (ChangeSize cd) ud (cd)] ++ (comToState xs (Turtle (a,b) ir (ChangeSize cd) ud (cd)))
            where
              cd = d+cz


-- | Function to change list of TurtleState to Picture
stateToPic :: [TurtleState] -> Picture
stateToPic list = case list of
    [] ->  blank
    Turtle (a,b) r (Forward) MyPenDown cz : xs -> ( polyline [(a,b),(newX,newY)])& (stateToPic xs)
            where newX = (a+cz*(cos r))
                  newY = (b+cz*(sin r))
    Turtle (a,b) r (Forward) MyPenUp cz : xs -> ( polyline [(newX,newY),(newX,newY)])& (stateToPic xs)
            where newX = (a+cz*(cos r))
                  newY = (b+cz*(sin r))
    _ :xs-> stateToPic xs




-- Task 3: Boundary of a T-Square


-- Define a function to generate T-Square commands
tSquare :: Int -> Double -> [TurtleCommand]
tSquare depth sideLength
    | depth < 0 || sideLength < 0 = error "Depth and side length must be non-negative."
    | otherwise = [ChangeSize (-1),PenUp, ChangeSize (sideLength/2), Forward, PenDown,Turn (pi/2)] ++ cs ++cs ++ cs ++ cs ++ [Turn (pi/2),PenUp,Forward,Turn (pi)]
      where
        cs = corner depth (sideLength/2)


--helper fucntion to draw the corners
corner :: Int -> Double -> [TurtleCommand]
corner  depth side 
  |depth==0 = [Forward, Turn (pi/2), Forward]
  |otherwise =  [ChangeSize (-side/2), Forward, Turn (-pi/2)]++ corner (depth-1) (side/2) ++ corner (depth-1) (side/2) ++corner (depth-1) (side/2) ++ [Turn (-pi/2), Forward,ChangeSize (side/2)]

