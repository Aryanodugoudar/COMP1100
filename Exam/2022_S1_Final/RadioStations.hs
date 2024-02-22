module RadioStations where

-- Note that there are THREE functions for you to complete in this file.
-- It is NOT necessary to complete the earlier functions
-- before attempting the later functions.

-- Type definitions. DO NOT DELETE OR EDIT THESE.
-- You may add deriving statements.
--
-- A Frequency is either
-- - AM, with a number (in kHZ), or
-- - FM, with a number (in MHZ), or
-- - Digital.
-- A RadioStation has a name and a Frequency

data Frequency = AM Int | FM Double | Digital

data RadioStation = Station String Frequency

-- | stationName:
--
-- Given a RadioStation as input,
-- return its name.
--
-- Examples:
--
-- >>> stationName (Station "ABC Radio Canberra" (AM 666))
-- "ABC Radio Canberra"
--
-- >>> stationName (Station "triple j" (FM 101.5))
-- "triple j"
--
-- >>> stationName (Station "triple j Unearthed" Digital)
-- "triple j Unearthed"

stationName :: RadioStation -> String
stationName = undefined

-- | frequencyInMHZ:
--
-- Given a RadioStation as input,
-- use a Maybe type to return its frequency number in MHZ.
-- This means you should return Nothing for Digital stations,
-- and divide the number for AM stations by 1000.
--
-- Examples:
--
-- >>> frequencyInMHZ (Station "ABC Radio Canberra" (AM 666))
-- Just 0.666
--
-- >>> frequencyInMHZ (Station "triple j" (FM 101.5))
-- Just 101.5
--
-- >>> frequencyInMHZ (Station "triple j Unearthed" Digital)
-- Nothing

frequencyInMHZ :: RadioStation -> Maybe Double
frequencyInMHZ = undefined

-- | validStation:
--
-- Given a RadioStation as input,
-- return True if its name is not the empty String, and
-- - if it is AM, its number is between 527 and 1606 inclusive;
-- - if it is FM, its number is between 85 and 108 inclusive;
-- - (if it is Digital, you need only the check the name is non-empty);
-- Return False otherwise.  
--
-- Examples:
--
-- >>> validStation (Station "Minimum Frequency" (AM 527))
-- True
--
-- >>> validStation (Station "" (AM 999))
-- False
--
-- >>> validStation (Station "Invalid Frequency" (AM 526))
-- False

validStation :: RadioStation -> Bool
validStation = undefined