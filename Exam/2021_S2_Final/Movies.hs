module Movies where

-- Genre, Title, Cast, Year, Movie definitions. DO NOT EDIT THESE.

data Genre = Romance | Thriller | Comedy | Action | SF deriving (Eq, Show)

type Title = String

type Name = String

type Cast = [Name]

type Year = Int

data Movie = Movie Title Genre Year Cast deriving (Eq, Show)

-- This is an example Movie. Your code will be tested on different Movies.
exMovie :: Movie
exMovie = Movie "High Society" Romance 1956 ["Grace Kelly","Bing Crosby"] 

-- | getTitle
--
-- Given a Movie as input,
-- return the Title of the Movie.
-- 
-- Examples:
-- 
-- >>> getTitle exMovie
-- "High Society"
--

getTitle :: Movie -> Title
getTitle = undefined

-- | addCast
--
-- Given a Movie and a Name as input,
-- add the Name to the front of Cast of the Movie.
-- Names should be unique in Cast.
-- 
-- Examples:
-- 
-- >>> addCast exMovie "Frank Sinatra"
-- Movie "High Society" Romance 1956 ["Frank Sinatra","Grace Kelly","Bing Crosby"]
--

addCast :: Movie -> Name -> Movie
addCast = undefined

-- | filterGenre
--
-- Given a list of Movies and a Genre as input,
-- return a list of Movies that are of the given Genre.
-- If the input list is empty, return an empty list.
--
-- Examples:
--
-- >>> filterGenre [exMovie,(Movie "Home Alone" Comedy 1990 ["Macaulay Culkin","Joe Pesci"])] Comedy
-- [Movie "Home Alone" Comedy 1990 ["Macaulay Culkin","Joe Pesci"]]
-- 
-- >>> filterGenre [] Action
-- []
--
filterGenre :: [Movie] -> Genre -> [Movie]
filterGenre = undefined 

