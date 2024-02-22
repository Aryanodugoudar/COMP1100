{-|
Module      : Season
Author      : Debashish Chakraborty, Aryan Odugoudar u7689173
Date        : 29/01/2019
Description : This module contains functions to check characteristics of 
              different seasons.
-}
module Season where

data Season = Spring | Summer | Autumn | Winter
    deriving Show

-- | Season.
--
-- >>> isCold Winter
-- True
--
-- >>> isCold Summer
-- False

isCold :: Season -> Bool
isCold season = case season of
    -- Spring -> False
    -- Summer -> False
    -- Autumn -> False
    Winter -> True
    _ -> False
