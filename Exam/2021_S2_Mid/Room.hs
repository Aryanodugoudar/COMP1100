module Room where

-- Room, Space, Size definitions. DO NOT EDIT THESE.

-- Size of the rectangular room is the length of the two sides
type Size = (Double, Double)

-- Rooms are rectangular
data Room = Livingroom Size | Bathroom Size| Bedroom Size deriving (Show,Eq)

type Space = [Room]

-- | doesRoomFit:
-- Given a Room and a Size as input,
-- return True if the room fits inside the Size given.
-- return False otherwise.
-- 
-- Examples:
--
-- >>> doesRoomFit (Bathroom (8.0,1.0)) (9.1,5.2)
-- True
-- >>> doesRoomFit (Bathroom (1.0,9.1)) (9.1,5.2)
-- True
-- >>> doesRoomFit (Bedroom (9.2,1.1)) (9.1,5.2)
-- False

doesRoomFit :: Room -> Size -> Bool
doesRoomFit room (l2, w2)
    | l <= l2 && w <= w2 = True
    | otherwise = False
  where
    (l, w) = case room of
        Livingroom (lengthR, widthR) -> (lengthR, widthR)
        Bathroom (lengthR, widthR) -> (lengthR, widthR)
        Bedroom (lengthR, widthR) -> (lengthR, widthR)

-- | roomCount:
-- Given a Space and a Room as input, 
-- return the total number of this Room 
-- (with the exact dimensions) in this Space
--
-- Examples:
--
-- >>> roomCount [Bedroom (1,1), Livingroom (2.5,4.8), Bedroom (5,8)] (Bedroom (1.1,1))
-- 0
--
-- >>> roomCount [Bedroom (1,1), Livingroom (2.5,4.8), Bathroom (1,1), Bedroom (1,1)] (Bedroom (1,1))
-- 2

roomCount :: Space -> Room -> Int
roomCount = undefined

foo :: String -> Int -> String
foo "a" 1 "a" =  "aedc"
