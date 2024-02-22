module Mensuration where

data Shape
  = Circle Double -- ^ Radius
  | Square Double -- ^ Side length
  | Rectangle Double Double -- ^ Width, Height


-- | Mensturation.
--
-- >>> area (Circle 3.14) 
-- 30.974846927333928


area :: Shape -> Double
area shape = case shape of
    Circle radius -> pi*radius*radius
    Square len -> len*len
    Rectangle wid hig -> wid*hig