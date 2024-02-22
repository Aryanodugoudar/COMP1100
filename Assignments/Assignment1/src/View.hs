--- Copyright 2023 The Australian National University, All rights reserved

module View where

import CodeWorld
import Data.Text (pack)
import Model


distance :: Point -> Point -> Double
distance (x1, y1) (x2, y2) = sqrt (((x2 - x1) ^ 2 )+ ((y2 - y1) ^ 2))


-- | Render all the parts of a Model to a picture.
-- | You do not need to understand all parts of this function.
modelToPicture :: Model -> Picture
modelToPicture (Model ss t c) =
  translated 0 8 toolText
    & translated 0 7 colourText
    & translated 0 (-8) areaText
    & pictures (map colourShapeToPicture ss)  -- Display shapes from sample list
    & coordinatePlane
  where
    colourText :: Picture
    colourText = stringToText (show c)

    toolText :: Picture
    toolText = stringToText (toolToLabel t)

    areaText :: Picture
    areaText =
      case t of
        (EllipseTool _ pstretch rstretch) ->
          stringToText $
            "Perpendicular stretch: " ++ takeWhile (/= '.') (show pstretch) ++
            take 2 (dropWhile (/= '.') (show pstretch)) ++
            "\nRadius stretch: " ++ takeWhile (/= '.') (show rstretch) ++
            take 2 (dropWhile (/= '.') (show rstretch))
        _ -> stringToText ""

    stringToText = lettering . pack




toolToLabel :: Tool -> String
toolToLabel tool= case tool of
    LineTool _ -> "Line: click-drag-release"
    RectangleTool _ -> "Rectangle: click-drag-release the diagonal"
    PolyTool _ -> "Polygon: click 3 or more times then spacebar"
    SemiCircleTool _ _ -> "SemiCircle: click-drag-release the diameter"
    EllipseTool _ _ _ -> "Ellipse: click-drag-release the diameter, then use arrows to stretch"



-- Render a single shape with its color
colourShapeToPicture :: ShapeColour -> Picture
colourShapeToPicture (shape, colorName) =
  colored (colourNameToColour colorName) (shapeToPicture shape)


colourShapesToPicture :: [ShapeColour] -> Picture
colourShapesToPicture shapesColors = case shapesColors of
  [] -> blank
  (shapeColor:rest) -> colourShapeToPicture shapeColor & colourShapesToPicture rest





colourNameToColour :: ColourName -> Colour
colourNameToColour name =
  case name of
    Red -> red
    MostlyRed -> RGB 0.8 0 0.2
    KindaRed -> RGB 0.6 0 0.4
    RedAndBlue -> RGB 0.5 0 0.5
    KindaBlue -> RGB 0.4 0 0.6
    MostlyBlue -> RGB 0.2 0 0.8
    Blue -> blue 




shapeToPicture :: Shape -> Picture
shapeToPicture shape =
  case shape of
    Line start end -> polyline [start, end]
    Rectangle p1 p2 ->
      translated ((fst p1 + fst p2) / 2) ((snd p1 + snd p2) / 2) $
      solidRectangle (abs (fst p2 - fst p1)) (abs (snd p2 - snd p1))
    Polygon points -> solidPolygon points
    SemiCircle p1 p2 p3 ->
      translated ((fst p1 + fst p2) / 2) ((snd p1 + snd p2) / 2) $
      rotated (p3) $  
      sector  (pi) (pi*(3/2)) (distance p1 p2 / 2) &
      sector 0 (pi/2) (distance p1 p2 / 2)
    Ellipse p1 p2 stretchX stretchY ->
      translated ((fst p1 + fst p2) / 2) ((snd p1 + snd p2) / 2) $
      rotated rotation $
      scaled stretchX stretchY $ solidCircle (distance p1 p2 / 2)
        where
          rotation = atan2 (snd p2 - snd p1) (fst p2 - fst p1)


