--- Copyright 2023 The Australian National University, All rights reserved

module Model where

import CodeWorld

data Shape
  -- | The Line constructor holds the start and end coordinates of the line.
  = Line Point Point
  -- | The Rectangle constructor either holds the left bottom and right top
  --   corners of the rectangle, or the left top and right bottom corners.
  | Rectangle Point Point
  -- | The Polygon constructor holds a list of points representing the vertices.
  | Polygon [Point]
  -- | For the SemiCircle, we have two points representing the diameter of the
  --   circle, and a number representing the rotation.
  | SemiCircle Point Point Double
  -- | The Ellipse constructor holds two points that represent the diameter of
  --   the initial circle, and two numbers representing the stretch
  --   in the direction of the initial diameter and the stretch perpendicular to
  --   the initial diameter, respectively.
  | Ellipse Point Point Double Double
  deriving (Show, Eq) -- You are not expected to understand this line.

type ShapeColour = (Shape, ColourName)

data Tool
  = LineTool (Maybe Point)
  | RectangleTool (Maybe Point)
  | PolyTool [Point]
  | SemiCircleTool (Maybe Point) Double
  | EllipseTool (Maybe Point) Double Double
  deriving (Show, Eq) -- You are not expected to understand this line.

data ColourName
  = Red        -- red
  | MostlyRed  -- red with a little blue
  | KindaRed   -- red with even more blue
  | RedAndBlue -- as much red and blue
  | KindaBlue  -- blue with lots of red
  | MostlyBlue -- blue with a little bit of red
  | Blue       -- blue
  deriving (Show, Eq) -- You are not expected to understand this line.

data Model = Model [ShapeColour] Tool ColourName
  deriving (Show) -- You are not expected to understand this line.

-- | Starting Model for when CodeWorld first starts up.
startModel :: Model
startModel = Model [] (LineTool Nothing) Red

-- | A sample image.
sample :: [ShapeColour]
sample = [(Line (-7.11,3.08) (-2.52,3.55),Red),
          (Line (-2.02,4.16) (-8.10,3.26),MostlyRed),
          (Line (-3.27,4.99) (-3.12,2.78),KindaRed),
          (Line (-4.17,5.17) (-3.38,2.95),RedAndBlue),
          (Line (-5.07,4.82) (-3.82,2.84),KindaBlue),
          (Line (-5.77,4.47) (-4.41,2.76),MostlyBlue),
          (Line (-6.48,4.27) (-5.05,2.80),Blue),
          (Rectangle (-8.1,-6.1) (-7,-5.7),   Blue),
          (Rectangle (-6,-5.4)   (-8.2,-6.2), Red),
          (Rectangle (-5.5,-6.3) (-8.3,-5.1), MostlyRed),
          (Rectangle (-8.4,-4.8) (-5,-6.4),   KindaRed),
          (Rectangle (-8.5,-6.5) (-4.5,-4.5), RedAndBlue),
          (Rectangle (-4,-4.2)   (-8.6,-6.6), KindaBlue),
          (Rectangle (-8.7,-6.7) (-3.5,-3.9), MostlyBlue),
          (Rectangle (-3,-6.8)   (-8.8,-3.6), Blue),
          (Rectangle (-8.9,-3.3) (-2.5,-6.9), Red),
          (Rectangle (-9,-7)     (-2,-3),     Blue),
          (Polygon [(6.21,3.61),(6.76,3.76),(6.23,3.00),(5.75,3.41),(6.26,4.03)],Blue),
          (Polygon [(8.36,7.34),(6.98,6.31),(8.17,5.17),(7.46,4.20),(6.17,4.88)],Red),
          (Polygon [(5.84,4.91),(5.20,3.66),(4.24,4.84)],MostlyRed),
          (Polygon [(6.39,2.36),(6.85,2.01),(6.98,3.15)],Blue),
          (Polygon [(6.41,2.16),(4.13,2.07),(5.18,3.26)],KindaRed),
          (Polygon [(3.62,2.10),(2.98,2.36),(3.97,3.79)],RedAndBlue),
          (Polygon [(6.94,1.90),(7.07,3.13),(8.14,4.75)],KindaBlue),
          (Polygon [(7.42,3.85),(6.26,2.36),(5.23,3.37),(6.06,4.80)],Red),
          (Polygon [(3.93,2.45),(5.20,3.37),(4.04,4.97)],MostlyBlue),
          (Polygon [(3.09,2.91),(4.02,3.98),(3.03,4.99)],Blue),
          (SemiCircle (1.5,1.5) (2.5,2.5) (0.6*pi),  Red),
          (SemiCircle (1,1)     (3,3)     (0.4 *pi), MostlyRed),
          (SemiCircle (0.5,0.5) (3.5,3.5) (0.2*pi),  RedAndBlue),
          (SemiCircle (0,0)     (4,4)      0,        MostlyBlue),
          (SemiCircle (1,-3)    (2,-2)    (0.25*pi), Blue),
          (SemiCircle (2,-2)    (3,-3)    (0.75*pi), Blue),
          (SemiCircle (4,-2)    (3,-3)    (0.25*pi), Blue),
          (SemiCircle (5,-2)    (4,-3)    (0.75*pi), Blue),
          (SemiCircle (2,-2)    (3,-1)    (0.25*pi), Blue),
          (SemiCircle (2,-3)    (3,-4)    (0.25*pi), Blue),
          (SemiCircle (0,-2)    (1,-3)    (0.75*pi), Blue),
          (SemiCircle (1,-3)    (2,-4)    (0.75*pi), Blue),
          (SemiCircle (3,-3)    (4,-4)    (0.75*pi), Blue),
          (SemiCircle (1,-1)    (2,-2)    (0.75*pi), Blue),
          (SemiCircle (3,-1)    (4,-2)    (0.75*pi), Blue),
          (Ellipse (-4,0)   (-3,0)     1 1, Blue),
          (Ellipse (-4,0)   (-3,0)     2 1, MostlyBlue),
          (Ellipse (-4,0)   (-3,0)     3 1, KindaBlue),
          (Ellipse (-4,0)   (-3,0)     4 1, RedAndBlue),
          (Ellipse (6.7,-6.7) (5.3,-5.3) 2 1, Blue),
          (Ellipse (7,-6)   (5,-6)     3 0.9, KindaBlue),
          (Ellipse (6.7,-5.3) (5.3,-6.7) 4 0.8, KindaRed),
          (Ellipse (6,-5)   (6,-7)     4 0.5, Red)]
