module Managers where

-- **This file is for both COMP1100 and COMP1130 students**

-- There are three functions to complete in this file.
-- It is NOT necessary to complete any of the earlier questions
-- to attempt the later questions.

-- This import is used for the doctests
-- It may cause a warning when you test your code.
-- You may ignore this warning.

import Data.List

-- Type declarations for Binary Trees,
-- Names, ID Numbers, and Employees.
-- DO NOT EDIT OR DELETE THESE
-- (You may add 'deriving' clauses)

-- For the first two questions, each Employee may supervise
-- at most two Employees;
-- this information will be represented as a Binary Tree

data BinaryTree a = Null
                  | Node (BinaryTree a) a (BinaryTree a)

type Name = String

type IDNumber = Int

data Employee = Employee Name IDNumber 

-- These test Binary Trees are provided for the purpose of doctests.
-- There will be no need to edit them.
-- Your solutions should work for *all* Trees of Employees,
-- not merely these test Trees.

testTree :: BinaryTree Employee
testTree = Node (Node Null (Employee "B. Wayne" 1234) Null) (Employee "B. Allen" 1459) (Node Null (Employee "N. Drake" 1789) Null)

testTree2 :: BinaryTree Employee
testTree2 = Node testTree (Employee "O. Dunham" 1658) (Node Null (Employee "D. Scully" 1564) Null)

-- | getAllEmployees:
-- Given a BinaryTree of Employees,
-- output the list of Names of all Employees in the Tree.
-- This output must be in the following order, for each Employee:
-- - First, the right child and all its descendants;
-- - Then, the left child and all its descendants;
-- - Finally, the Employee at the root of the subtree.
--
-- Examples:
-- >>> getAllEmployees testTree
-- ["N. Drake","B. Wayne","B. Allen"]
--
-- >>> getAllEmployees testTree2
-- ["D. Scully","N. Drake","B. Wayne","B. Allen","O. Dunham"]

getAllEmployees :: BinaryTree Employee -> [String]
getAllEmployees tree = case tree of
  Null -> []
  Node left (Employee name _) right ->
    getAllEmployees right ++ getAllEmployees left ++ [name]

-- | totalLowestEmployees:
-- Given a BinaryTree of Employees,
-- return the number of Employees who are not managers of anyone.
--
-- Examples:
-- >>> totalLowestEmployees testTree
-- 2
--
-- >>> totalLowestEmployees testTree2
-- 3
--
totalLowestEmployees :: BinaryTree Employee -> Int
totalLowestEmployees tree = case tree of
  Null -> 0
  Node Null _ Null -> 1
  Node left _ right -> totalLowestEmployees left + totalLowestEmployees right

-- Type declaration for Rose Trees
-- DO NOT EDIT OR DELETE THIS
-- (You may add 'deriving' clauses)

-- For the final question, each Employee may supervise
-- any number of Employees;
-- this information will be represented as a Rose Tree.

data Rose a = Rose a [Rose a]

-- These test Rose Trees are provided for the purpose of doctests.
-- There will be no need to edit them.
-- Your solutions should work for *all* Trees of Employees,
-- not merely these test Trees.

testRose :: Rose Employee
testRose = Rose (Employee "O. Dunham" 1658) []

testRose2 :: Rose Employee
testRose2 = Rose (Employee "O. Dunham" 1658) [Rose (Employee "B. Allen" 1459) [], Rose (Employee "N. Drake" 1789) [], Rose (Employee "B. Wayne" 1234) []]

-- | getAllEmployeesRose:
-- Given a Rose Tree of Employees,
-- output the list of Names of all Employees in the Tree.
-- Any ordering of the Names is acceptable.
--
-- Examples (with sorting so that your code does not fail based on list order):
--
-- >>> getAllEmployeesRose testRose
-- ["O. Dunham"]
--
-- >>> sort (getAllEmployeesRose testRose2)
-- ["B. Allen","B. Wayne","N. Drake","O. Dunham"]

getAllEmployeesRose :: Rose Employee -> [String]
getAllEmployeesRose (Rose (Employee name _) roses) =
  name : concatMap getAllEmployeesRose roses