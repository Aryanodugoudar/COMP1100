module TypeChecking where

-- **This file is for COMP1130 STUDENTS ONLY**
-- **Do NOT attempt if you are a COMP1100 Student**

-- Type definitions for the fragment of the lambda calculus
-- without application,
-- and for simple types with a single base type called 'Base'
-- DO NOT EDIT OR DELETE THESE
-- (You may add 'deriving' clauses)

type Name = String

data Term = Var Name
          | Lam Name Term
  deriving Show

data Type = Base | Arrow Type Type
  deriving Show

type Basis = [(Name,Type)]

-- | typeChecks:
-- Given a basis, a term (without application), and a type,
-- return True if that term can have that type given that basis.
--
-- You may assume that the starting basis does not contain any
-- variable name twice.
--
-- Examples:
--
-- >>> typeChecks [("x",Base),("y",Arrow Base Base)] (Var "x") Base
-- True
--
-- >>> typeChecks [("x",Arrow Base Base)] (Var "x") Base
-- False
--
-- >>> typeChecks [("y",Base)] (Var "x") Base
-- False
--
-- >>> typeChecks [] (Lam "x" (Var "x")) (Arrow Base Base)
-- True

typeChecks :: Basis -> Term -> Type -> Bool
typeChecks = undefined