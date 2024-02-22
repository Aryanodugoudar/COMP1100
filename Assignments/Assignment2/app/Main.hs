{-# LANGUAGE OverloadedStrings #-}

module Main where

import CodeWorld
import qualified Turtle as Turtle
import TestPatterns

-- | Represents various drawing modes for our turtle.
data Mode
  = Simple            
     -- ^ Mode to draw the `simple` test pattern.
  | Comp1100           
    -- ^ Mode to draw the `comp1100` test pattern.
  | Triangle Double    
    -- ^ Mode to draw a triangle with a specified perimeter.
  | Polygon Int Double 
    -- ^ Mode to draw a polygon with a given number of sides and perimeter.
  | TSquare Rescaled Int Double 
    -- ^ Mode to draw the T-square fractal, with a boolean representing if 
    -- it is zoomed in, it's depth and side length.

-- | True if the fractal is rescaled (zoomed in), false otherwise.
type Rescaled = Bool

-- | The main function runs an interactive CodeWorld session.
main :: IO ()
main = activityOf Comp1100 handleEvent render

-- | Handles events and updates the current drawing mode.
handleEvent :: Event -> Mode -> Mode
handleEvent (KeyPress k) mode
  -- Switch to Simple mode.
  | k == "S" = Simple 

  -- Switch to Comp1100 mode.
  | k == "C" = Comp1100 
  
  -- If in Triangle mode stay in current mode,
  -- otherwise switch to Triangle mode with a default perimeter of 9.
  | k == "T" = case mode of
      Triangle _    -> mode
      _             -> Triangle 9 
  
  -- If in Polygon mode stay in current mode, otherwise
  -- switch to Polygon mode with default of 5 sides and perimeter of 12.
  | k == "P" = case mode of
      Polygon _ _   -> mode 
      _             -> Polygon 5 12.0 

  | k == "=" = case mode of
      -- Increment the number of sides for a polygon.
      Polygon n p   -> Polygon (succ n) p 
      
      -- Increment the depth of TSquare.
      TSquare z n s -> TSquare z (succ n) s       
      _             -> mode 

  | k == "-" = case mode of
      -- Decrement polygon sides with a minimum of 3.
      Polygon n p   -> Polygon (max (pred n) 3) p 
      
      -- Decrement TSquare depth with a minimum of 0.
      TSquare z n s -> TSquare z (max (pred n) 0) s 
      _             -> mode 

  | k == "]" = case mode of
      -- Increase polygon perimeter.
      Polygon n p   -> Polygon n   (p + 0.1) 
      
      -- Increase triangle perimeter.
      Triangle s    -> Triangle    (s + 0.1) 
      
      -- Increase TSquare side length.
      TSquare z n s -> TSquare z n (s + 0.1) 
      _             -> mode
      
  | k == "[" = case mode of
      -- Decrease polygon perimeter with a minimum of 0.
      Polygon n p   -> Polygon n   (max (p - 0.1) 0) 
      
      -- Decrease triangle perimeter with a minimum of 0.
      Triangle s    -> Triangle    (max (s - 0.1) 0) 
      
      -- Decrease TSquare side length with a minimum of 0.
      TSquare z n s -> TSquare z n (max (s - 0.1) 0) 
      _             -> mode

  -- If in TSquare mode stay in current mode, otherwise
  -- switch to TSquare mode with default parameters.
  | k == "F" = case mode of
      TSquare _ _ _ -> mode 
      _             -> TSquare False 0 10.0 

  -- Toggle TSquare rescaled state.
  | k == "Z" = case mode of
      TSquare z n s -> TSquare (not z) n s 
      _             -> mode

-- If the event is not a key press, return the current mode unchanged.
handleEvent _ mode = mode 


-- | Renders the current 'Mode' as a picture.
render :: Mode -> Picture
render mode = coloured red picture & coordinatePlane
  where 
    picture = case mode of 
        Simple        -> Turtle.runTurtle $ TestPatterns.simple
        Comp1100      -> Turtle.runTurtle $ TestPatterns.comp1100
        Triangle s    -> Turtle.runTurtle $ Turtle.triangle s
        Polygon n p   -> Turtle.runTurtle $ Turtle.polygon n p
        TSquare z n s
            | z         -> (translated (-10) (-10) . scaled 2 2)  
                              $ Turtle.runTurtle $ Turtle.tSquare n s
            | otherwise -> id $ Turtle.runTurtle $ Turtle.tSquare n s
