module Main where

import Controller
import Model
import View
import Testing

-- | The list of all tests to run.
tests :: [Test]
tests = toolLabelTests ++ nextColourTests ++ nextToolTests

-- | Tests the labels of the various tools.
toolLabelTests :: [Test]
toolLabelTests =
  [ Test "LineTool"
      (assertEqual (toolToLabel (LineTool Nothing))
       "Line: click-drag-release")
  , Test "RectangleTool"
      (assertEqual (toolToLabel (RectangleTool Nothing))
       "Rectangle: click-drag-release the diagonal")
  , Test "PolyTool"
      (assertEqual (toolToLabel (PolyTool []))
      "Polygon: click 3 or more times then spacebar")
  , Test "SemiCircleTool"
      (assertEqual (toolToLabel (SemiCircleTool Nothing 0))
      "SemiCircle: click-drag-release the diameter")
  , Test "EllipseTool"
      (assertEqual (toolToLabel (EllipseTool Nothing 1 1))
       "Ellipse: click-drag-release the diameter, then use arrows to stretch")
  ]

-- | Tests the transition of the colours
nextColourTests :: [Test]
nextColourTests =
  [ Test "Red -> MostlyRed" (assertEqual (nextColour Red) MostlyRed)
  , Test "MostlyRed -> KindaRed" (assertEqual (nextColour MostlyRed) KindaRed)
  , Test "KindaRed -> RedAndBlue" (assertEqual (nextColour KindaRed) RedAndBlue)
  , Test "RedAndBlue -> KindaBlue" (assertEqual (nextColour RedAndBlue) KindaBlue)
  , Test "KindaBlue -> MostlyBlue" (assertEqual (nextColour KindaBlue) MostlyBlue)
  , Test "MostlyBlue -> Blue" (assertEqual (nextColour MostlyBlue) Blue)
  , Test "Blue -> Red" (assertEqual (nextColour Blue) Red)
  ]

-- | Tests for nextTool, including tests that it doesn't cycle tools
-- midway through drawing.
nextToolTests :: [Test]
nextToolTests =
  [ Test "Line -> Rectangle"
      (assertEqual (nextTool (LineTool Nothing)) (RectangleTool Nothing))
  , Test "Rectangle -> Polygon"
      (assertEqual (nextTool (RectangleTool Nothing)) (PolyTool []))
  , Test "Polygon -> SemiCircle"
      (assertEqual (nextTool (PolyTool [])) (SemiCircleTool Nothing 0))
  , Test "SemiCircle -> Ellipse"
      (assertEqual (nextTool (SemiCircleTool Nothing 0)) (EllipseTool Nothing 1 1))
  , Test "Ellipse -> Line"
        (assertEqual (nextTool (EllipseTool Nothing 1 1)) (LineTool Nothing))
  , Test "Line (in use) -> Line"
      (assertEqual (nextTool (LineTool (Just (0,1)))) (LineTool (Just (0,1))))
  , Test "Rectangle (in use) -> Rectangle"
      (assertEqual (nextTool (RectangleTool (Just (1,2)))) (RectangleTool (Just (1,2))))
  , Test "Polygon (in use) -> Polygon"
      (assertEqual (nextTool (PolyTool [(2,3)])) (PolyTool [(2,3)]))
  , Test "SemiCircle (in use) -> SemiCircle"
      (assertEqual (nextTool (SemiCircleTool (Just (4,5)) 0)) (SemiCircleTool (Just (4,5)) 0))
  , Test "Ellipse (in use) -> Ellipse"
      (assertEqual (nextTool (EllipseTool (Just (8,9)) 1 2)) (EllipseTool (Just (8,9)) 1 2))
  ]

-- | A Haskell program starts by running the computation defined by
-- 'main'. We run the list of tests that we defined above.
main :: IO ()
main = runTests tests
