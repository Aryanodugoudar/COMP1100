module EtaReduction where

-- There is ONE function for you to complete in this file.

import Data.List

-- Type definitions. DO NOT DELETE OR EDIT THESE.
-- You may add deriving statements.

type Name = String

data Term = Var Name | App Term Term | Lam Name Term
  deriving Show

-- The following function is provided for you.
-- YOU DO NOT NEED TO EDIT THIS FUNCTION.

-- | free:
--
-- List of free variables of a Term.

free :: Term -> [Name]
free term = case term of
  Var n -> [n]
  App t u -> union (free t) (free u)
  Lam n t -> delete n (free t)

-- | eta:
--
-- eta-reduction is another notion of reduction for lambda rules:
--   \x.A x -> A  if x is not in the free variables of A.
--
-- Implement eta-reduction in the non-deterministic style, i.e.
-- - make as many eta-reductions as possible;
-- - make eta-reductions wherever they appear in a term;
-- - you will not be marked on the order in which you reduce.
--
-- Examples:
--
-- >>> eta (Lam "x" (App (Var "y") (Var "x")))
-- Var "y"
--
-- >>> eta (Lam "x" (App (Var "x") (Var "x")))
-- Lam "x" (App (Var "x") (Var "x"))
--
-- >>> eta (App (Lam "v" (App (Var "w") (Var "v"))) (Lam "x" (App (Var "y") (Var "x"))))
-- App (Var "w") (Var "y")

eta :: Term -> Term
eta = undefined