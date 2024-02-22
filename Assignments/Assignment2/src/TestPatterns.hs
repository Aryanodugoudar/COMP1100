{-|
Module      : TestPatterns
Description : A collection of patterns to test the interpreter in Turtle.hs
Maintainer  : Zofia Francis

-}

module TestPatterns where

import Turtle

-- | A heavily commented simple example to test your interpreter
-- which assumes that the turtle starts with PenUp at (0,0), facing north, with
-- a step size of 1
simple :: [TurtleCommand]
simple = 
  [ PenDown, Turn (-angleA), ChangeSize 4, Forward
  -- ^ Put the pen down, turn clockwise 0.927 radians, adjust the step
  -- size to 5, and move forward 5 units while drawing
  , PenUp, Turn (pi - angleB), ChangeSize (-1), Forward
  -- ^ Lift the pen up, turn anticlockwise 2.498 radians, adjust the 
  -- step size to 4, move forward 4 units without drawing
  , PenDown, Turn (pi - angleB), ChangeSize 1, Forward
  -- ^ Put the pen down, turn anticlockwise 2.498 radians, adjust the 
  -- step size to 5, move forward 5 units while drawing
  , PenUp, Turn (-(pi - angleB)), ChangeSize (-1), Forward
  -- ^ Lift the pen up, turn clockwise 2.498 radians, adjust the 
  -- step size to 4, move forward 4 units without drawing
  , Turn (-pi/2), ChangeSize (-3)
  -- ^ Turn clockwise pi/2 radians return the facing to 0, 
  -- adjust the step size to 1.
  ]
  where
    angleA = atan (4/3) -- approx 0.9273 radians, 53.13 degrees
    angleB = atan (3/4) -- approx 0.6435 radians, 36.87 degrees
    -- ^ the two internal angles of a 3-4-5 right angle triangle in radians

-- | A more complex example to test your interpreter. In-line comments indicate
-- the current step size.
comp1100 :: [TurtleCommand]
comp1100 = concat [start, c, o, m, p, one, one, o, o]
  where
    start = [PenUp, s 0.5, f, l, s 7.75, f, r, s (-8.25)]
    c =
      [ r, s 0.5, f             -- s = 1 + 0.5 = 1.5
      , l, s (-1), f, PenDown   -- s = 0.5
      , l, l', s (d - 0.5), f   -- s = 0.5 + d -0.5 = d
      , r', s (1 - d), f        -- s = d + 1 - d = 1
      , r', s (d - 1), f        -- s = 1 + d - 1 = d 
      , r', s (2 - d), f        -- s = d + 2 - d = 2 
      , r', s (d - 2), f        -- s = d
      , r', s (1 - d), f        -- s = 1
      , r', s (d - 1), f, PenUp -- s = d
      , r', s (2.5 - d), f      -- s = 2.5
      , l,  s (-1.5), f         -- s = 1
      , l
      ]
    o =
      [ r,     s 0.5,       f            -- s = 1.5
      , l,     s (-1),      f, PenDown   -- s = 0.5
      , l, l', s (d - 0.5), f            -- s = d
      , r',    s (1 - d),   f            -- s = 1
      , r',    s (d - 1),   f            -- s = d
      , r',    s (2 - d),   f            -- s = 2
      , r',    s (d - 2),   f            -- s = d
      , r',    s (1 - d),   f            -- s = 1
      , r',    s (d - 1),   f            -- s = d
      , r',    s (2 - d),   f, PenUp     -- s = 2
      ,        s (-1.5),    f            -- s = 0.5
      , l,     s 0.5,       f            -- s = 1
      , l
      ]
    m =
      [ l,     s (-0.5),      f, r, PenDown -- s = 0.5
      ,        s 2.5,         f             -- s = 3      
      , r, r', s (d * 2 - 3), f             -- s = (d * 2)
      , l,                    f             -- s = (d * 2)
      , r, r', s (3 - d * 2), f,    PenUp   -- s = 3
      , l,     s (-2),        f, l          -- s = 1
      ]
    p =
      [ l    , s (-0.5)   , f, r, PenDown -- s = 0.5
             , s 2        , f             -- s = 2.5
      , r'   , s (d - 2.5), f             -- s = d  
      , r'   , s (1 - d)  , f             -- s = 1  
      , r'   , s (d - 1)  , f             -- s = d  
      , r'   , s (1 - d)  , f             -- s = 1  
      , r'   , s (d - 1)  , f             -- s = d  
      , r'   , s (1 - d)  , f             -- s = 1  
      , r'   , s (d - 1)  , f, PenUp      -- s = d  
      , r, r', s (3 - d)  , f             -- s = 3  
      , r    , s (-1.5)   , f             -- s = 1.5
      , l, l , s (-0.5)                   -- s = 1 
      ]
    one =
      [ PenDown
      , r               , f         -- s = 1  
      , l, l , s (-0.5) , f         -- s = 0.5
      , r    , s 2.5    , f         -- s = 3  
      , l, l', s (d - 3), f , PenUp -- s = d
                        , f         -- s = d  
      , l'   , s (2 - d), f         -- s = 2  
      , l    , s 0.5    , f         -- s = 2.5
      , l    , s (-1.5)             -- s = 1
      ]

    f = Forward

    -- Left/Right turns, pi/2 radians (90 degrees). Primed versions (the ones with an
    -- ' after: l', r') are pi/4 radians (45 degrees).
    l = Turn (pi/2)
    l' = Turn (pi/4)
    r = Turn (-pi/2)
    r' = Turn (-pi/4)

    -- Diagonal length of a right-angle triangle with both sides 0.5
    d = sqrt (2 * 0.5 * 0.5)

    -- Increasing and decreasing the step size
    s x = ChangeSize x
