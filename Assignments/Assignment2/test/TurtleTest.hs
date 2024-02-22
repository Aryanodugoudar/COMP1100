module Main where

import Turtle
import Testing

-- | The list of tests to run. When you define additional test cases,
-- you must list them here or they will not be checked.
tests :: [Test]
tests =
  [ triangle1
  , triangle2
  , polygon1
  , polygon2
  , polygon3
  , fractal1
  , fractal2
  ]

-- | Example test case. The String argument to 'Test' is a label that
-- identifies the test, and gives the reader some idea about what's
-- being tested. For simple arithmetic, these should be obvious, but
-- when you write tests for your turtle interpreter, you can use this
-- space to say things like "driving out and back leaves you in the
-- same position".
-- , exampleFailure
{-exampleTestOne
  , exampleTestTwo
  , exampleTestThree
  , exampleTestFour 
exampleTestOne :: Test
exampleTestOne = Test "2 + 2 == 4" (assertEqual (2 + 2) (4 :: Int))

-- | Because we are storing the turtle position in a pair of
-- 'Double's, addition behaves in ways you might not expect. The
-- 'assertApproxEqual' function tests that two 'Double's are close
-- enough to each other.
exampleTestTwo :: Test
exampleTestTwo = Test "0.1 + 0.2 =~ 0.3" (assertApproxEqual (0.1 + 0.2) 0.3)

-- | 0.1 + 0.2 is NOT 0.3 when computed using 'Double's. This is why
-- we have provided you with the 'assertApproxEqual' function.
exampleTestThree :: Test
exampleTestThree = Test "0.1 + 0.2 /= 0.3" (assertNotEqual (0.1 + 0.2) (0.3 :: Double))

-- | You might find it easier to write tests against entire 'Point's.
exampleTestFour :: Test
exampleTestFour = Test "(0.0, 0.1 + 0.2) =~ (0.0, 0.3)"
  (assertPointApproxEqual (0.0, 0.1 + 0.2) (0.0, 0.3))

-- | This test will fail, so you can see what a failing test looks
-- like.
--exampleFailure :: Test
--exampleFailure = Test "0.1 + 0.2 == 0.3" (assertEqual (0.1 + 0.2) (0.3 :: Double)) -}

triangle1 :: Test
triangle1 = Test "Triangle with perimeter 99"
                (assertEqual (triangle 99)
                [ChangeSize (-1) ,PenDown, ChangeSize (33), 
                 Turn (- pi / 6),
                Forward , Turn (- 2 * pi / 3),
                Forward , Turn (- 2 * pi / 3),Forward,
                 Turn (pi/2),PenUp] )

triangle2 :: Test
triangle2 = Test "Triangle with perimeter 1"
               (assertEqual (triangle 1) [ChangeSize (-1) ,PenDown, ChangeSize (1/3), 
                 Turn (- pi / 6),
                Forward , Turn (- 2 * pi / 3),
                Forward , Turn (- 2 * pi / 3),Forward,
                 Turn (pi/2),PenUp] )

polygon1 :: Test
polygon1 = Test "Testing polygon with 4 sides and perimeter 4"
               (assertEqual (polygon 4 4)
               [ChangeSize (-1.0),PenDown,ChangeSize 1.0,Turn (-pi/2),Forward,
               ChangeSize (-1.0),PenUp,PenDown,ChangeSize 1.0,Turn (-pi/2),
               Forward,ChangeSize (-1.0),PenUp,PenDown,ChangeSize 1.0,Turn (-pi/2),
               Forward,ChangeSize (-1.0),PenUp,PenDown,ChangeSize 1.0,Turn (-pi/2),
               Forward,ChangeSize (-1.0),PenUp]
                )

polygon2 :: Test
polygon2 = Test "Testing polygon with 7 sides and perimeter 21"
            (assertEqual (polygon 7 21)
            [ChangeSize (-1.0),PenDown,ChangeSize 3.0,Turn (-2*pi/7),Forward,
            ChangeSize (-3.0),PenUp,PenDown,ChangeSize 3.0,Turn (-2*pi/7),Forward,
            ChangeSize (-3.0),PenUp,PenDown,ChangeSize 3.0,Turn (-2*pi/7),Forward,
            ChangeSize (-3.0),PenUp,PenDown,ChangeSize 3.0,Turn (-2*pi/7),Forward,
            ChangeSize (-3.0),PenUp,PenDown,ChangeSize 3.0,Turn (-2*pi/7),Forward,
            ChangeSize (-3.0),PenUp,PenDown,ChangeSize 3.0,Turn (-2*pi/7),Forward,
            ChangeSize (-3.0),PenUp,PenDown,ChangeSize 3.0,Turn (-2*pi/7),Forward,
            ChangeSize (-3.0),PenUp])


polygon3 :: Test
polygon3 = Test "Testing Polygon with sides greater than perimeter 4 2"
            (assertEqual (polygon 4 2)
            [ChangeSize (-1.0),PenDown,ChangeSize 0.5,Turn (-pi/2),Forward,
            ChangeSize (-0.5),PenUp,PenDown,ChangeSize 0.5,Turn (-pi/2),Forward,
            ChangeSize (-0.5),PenUp,PenDown,ChangeSize 0.5,Turn (-pi/2),Forward,
            ChangeSize (-0.5),PenUp,PenDown,ChangeSize 0.5,Turn (-pi/2),Forward,
            ChangeSize (-0.5),PenUp])



fractal1 :: Test
fractal1 = Test "Testing Fractal with depth less than sideLength 0 2"
            (assertEqual (tSquare 0 2)
            [ChangeSize (-1.0),PenUp,ChangeSize 1.0,Forward,PenDown,Turn (pi/2),Forward,
            Turn (pi/2),Forward,Forward,Turn (pi/2),Forward,Forward,Turn (pi/2),
            Forward,Forward,Turn (pi/2),Forward,Turn (pi/2),PenUp,Forward,Turn (pi)])

fractal2 :: Test
fractal2 = Test " Testing Fractal with depth greater than sideLength 1 0.5"
            (assertEqual (tSquare 1 0.5)
            [ChangeSize (-1.0),PenUp,ChangeSize 0.25,Forward,PenDown,Turn (pi/2),ChangeSize (-0.125),
            Forward,Turn (-(pi/2)),Forward,Turn (pi/2),Forward,Forward,Turn (pi/2),Forward,
            Forward,Turn (pi/2),Forward,Turn (-(pi/2)),Forward,ChangeSize 0.125,ChangeSize (-0.125),
            Forward,Turn (-(pi/2)),Forward,Turn (pi/2),Forward,Forward,Turn (pi/2),Forward,Forward,Turn (pi/2),
            Forward,Turn (-(pi/2)),Forward,ChangeSize 0.125,ChangeSize (-0.125),Forward,Turn (-(pi/2)),Forward,
            Turn (pi/2),Forward,Forward,Turn (pi/2),Forward,Forward,Turn (pi/2),Forward,Turn (-(pi/2)),Forward,
            ChangeSize 0.125,ChangeSize (-0.125),Forward,Turn (-(pi/2)),Forward,Turn (pi/2),Forward,Forward,
            Turn (pi/2),Forward,Forward,Turn (pi/2),Forward,Turn (-(pi/2)),Forward,ChangeSize 0.125,Turn (pi/2),
            PenUp,Forward,Turn (pi)])
 
-- | A haskell program starts by running the computation defined by
-- 'main'. We run the list of tests that we defined above.
main :: IO ()
main = runTests tests