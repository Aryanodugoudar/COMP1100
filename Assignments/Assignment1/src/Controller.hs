module Controller where

import CodeWorld
import Model

import Data.Text (pack, unpack)

-- | Compute the new Model in response to an Event.
handleEvent :: Event -> Model -> Model
handleEvent event (Model shapes tool colour) =
  case event of
    KeyPress key
      -- revert to an empty canvas
      | k == "Esc" -> startModel

      -- write the current model to the console
      | k == "D" -> CodeWorld.trace (pack (show currentModel)) currentModel

      -- display the mystery image
      | k == "S" -> Model sample tool colour

   
      | k == "Backspace" || k == "Delete" -> case shapes of
        [] -> currentModel
        _ : x1 -> Model x1 tool colour

      
      | k == " " -> case tool of
        PolyTool points -> Model ((Polygon points, colour) : shapes) (PolyTool []) colour
        _ -> currentModel

      
      | k == "T" -> Model shapes (nextTool tool) colour

      
      | k == "C" -> Model shapes tool (nextColour colour)

      
      | k == "Up" -> case tool of
        EllipseTool mp x y -> Model shapes (EllipseTool mp x (y+0.1)) colour        
        SemiCircleTool mp x -> Model shapes (SemiCircleTool mp (x + pi*0.05)) colour
        _ -> currentModel

      
      | k == "Down" -> case tool of 
        EllipseTool mp x y -> Model shapes (EllipseTool mp x (y-0.1)) colour
        SemiCircleTool mp x -> Model shapes (SemiCircleTool mp (x - pi*0.05)) colour
        _ -> currentModel

      
      | k == "Left" -> case tool of 
        EllipseTool mp x y -> Model shapes (EllipseTool mp (x-0.1) y) colour
        _ -> currentModel

      
      | k == "Right" -> case tool of
        EllipseTool mp x y -> Model shapes (EllipseTool mp (x+0.1) y) colour
        _ -> currentModel

      -- ignore other keys
      | otherwise -> currentModel

      where
        k = unpack key

    
    PointerPress p -> case tool of
      LineTool _ -> Model shapes (LineTool (Just p)) colour
      RectangleTool _ -> Model shapes (RectangleTool (Just p)) colour
      PolyTool points -> Model shapes (PolyTool( p:points)) colour
      SemiCircleTool  _ r -> Model shapes (SemiCircleTool (Just p) r) colour
      EllipseTool _ scaleX scaleY-> Model shapes (EllipseTool (Just p) scaleX scaleY) colour


    
    PointerRelease q -> case tool of
      LineTool (Just p) -> Model ((Line p q, colour) : shapes) (LineTool Nothing) colour
      RectangleTool (Just p) -> Model ((Rectangle p q, colour) : shapes) (RectangleTool Nothing) colour
      SemiCircleTool (Just p) x -> Model ((SemiCircle p q x , colour) : shapes) (SemiCircleTool Nothing x) colour
      EllipseTool (Just p) x y -> Model ((Ellipse p q x y, colour) : shapes) (EllipseTool Nothing x y ) colour
      _ -> currentModel

    _ -> currentModel


    where
      currentModel :: Model
      currentModel = Model shapes tool colour


nextColour :: ColourName -> ColourName
nextColour colour= case colour of
  Red->MostlyRed
  MostlyRed->KindaRed
  KindaRed->RedAndBlue
  RedAndBlue->KindaBlue
  KindaBlue->MostlyBlue
  MostlyBlue->Blue
  Blue -> Red


nextTool :: Tool -> Tool
nextTool tool = case tool of
  LineTool Nothing -> RectangleTool Nothing
  RectangleTool Nothing -> PolyTool []
  PolyTool [] -> SemiCircleTool Nothing 0.0
  SemiCircleTool Nothing _ -> EllipseTool Nothing 1.0 1.0
  EllipseTool Nothing _ _ -> LineTool Nothing
  LineTool (Just _) -> tool
  RectangleTool (Just _) -> tool
  PolyTool (_:_) -> tool
  SemiCircleTool (Just _) _ -> tool
  EllipseTool (Just _) _ _ -> tool
