--- Copyright 2023 The Australian National University, All rights reserved
module View where

import CodeWorld

-- This function can be assigned to different pictures
-- (e.g. myRectangle, myRectangle', ...)


myPicture :: Picture
myPicture = solidLambda

-- For each exercise, create a new function below so that we can see you have
-- completed each exercise
-- (e.g. myRectangle, myRectangle', colouredRectangle, colouredSquares, ...)


-- Please make sure to have every exercises as a function so we have proof that 
-- you attempted all the exercises. 



myRectangle :: Picture
myRectangle = solidRectangle 3.5 3.5

myRectangle'::Picture
myRectangle' = translated 3 (-2) myRectangle

colouredRectangle :: Picture
colouredRectangle = coloured blue myRectangle'

colouredSquares :: Picture
colouredSquares = rotated 0.785398 ((coloured blue (translated (-2) (-2) myRectangle)) & (coloured yellow (translated 2 (-2) myRectangle)) & (coloured green (translated 2 2 myRectangle)) & (coloured orange (translated (-2) 2 myRectangle)))

lambda :: Picture
lambda = coordinatePlane & polyline [(3,6), (7,0), (5, 3), (3,0)] & polyline [(2,6), (4,3), (2,0)]

solidLambda :: Picture
solidLambda = coordinatePlane & solidPolygon [(3,1), (3.5,1), (5.5,4), (5, 4)] & solidPolygon [(7,1), (7.5,1), (3.5,7), (3, 7)]

