{-|
Module      : <module name>
Description : <short general purpose of module>
Maintainer  : <your email>

<Add a longer description of the module here if appropriate.>

-}
module Library where

type Name = String

type Year = Int

type Availability = Bool

data Video
  = Movie Name Year
  | Show Name Year
  deriving (Show, Eq)

type Library = [(Video, Availability)]

exampleLibrary :: Library
exampleLibrary =
  [ (Show "Westworld" 2017, False)
  , (Movie "Harry Potter and the Prisoner of Azkaban" 2004, False)
  , (Show "Game of Thrones" 2011, True)
  , (Movie "Thor: Ragnarok" 2017, False)
  , (Movie "Avengers: Endgame" 2019, False)
  , (Show "Attack on Titan" 2009, True)
  , (Show "Stranger Things" 2016, False)
  , (Movie "Star Wars: The Force Awakens" 2015, True)
  , (Show "The Walking Dead" 2010, True)
  , (Movie "Deadpool" 2016, True)
  ]


-- Function to get the name from a Video using a case expression
getName :: Video -> Name
getName video =
  case video of
    Movie name _ -> name
    Show name _  -> name

-- | Video Available.
-- 
-- >>> isVideoAvailable [] "Deadpool"
-- Nothing

-- >>> isVideoAvailable exampleLibrary "Deadpool"
-- True

-- >>> isVideoAvailable exampleLibrary "The Walking Dead"
-- True

-- Function to check if a video is available in the library
isVideoAvailable :: Library -> Name -> Maybe Availability
isVideoAvailable [] _ = Nothing
isVideoAvailable ((video, availability):rest) name
  | getName video == name = Just availability
  | otherwise             = isVideoAvailable rest name


-- | available video.
-- 
-- >>> availableVideos []
-- []

-- >>> availableVideos exampleLibrary
-- [Show "Game of Thrones" 2011,Show "Attack on Titan" 2009,Movie "Star Wars: The Force Awakens" 2015,Show "The Walking Dead" 2010,Movie "Deadpool" 2016]

-- Function to filter available videos from a library
availableVideos :: Library -> [Video]
availableVideos library =
  [video | (video, availability) <- library, availability == True]
