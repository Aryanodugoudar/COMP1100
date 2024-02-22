module GetUID where

------------------- DO NOT EDIT THE CODE BETWEEN THE LINES -------------------

type Courses = [String]
type UID = Int
type Name = String
type Salary = Double

data ANUPerson =
  Student Name UID Courses
  | Visitor Name UID
  | Staff UID Name Salary

------------------------------------------------------------------------------

-- Write a function 'getUID' that takes an 'ANUPerson' as an input
-- and returns their associated 'UID' as an output.
-- example: 
--   donovan :: ANUPerson
--   donovan = Visitor "Donovan Crichton" 6881864
--
--   getUID donovan = 6881864
getUID :: ANUPerson -> UID
getUID a= case a of
  Student _ uid _ -> uid
  Visitor _ uid -> uid
  Staff uid _ _ -> uid


donovan :: ANUPerson
donovan = Visitor "Donovan Crichton" 6881864


