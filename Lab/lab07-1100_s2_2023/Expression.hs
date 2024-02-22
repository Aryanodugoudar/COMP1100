module Expression where

-- | A token is plus, minus or a number
data Token
  = Plus
  | Minus
  | Num Double
  deriving (Show, Eq)

-- | Expression is a list of tokens
type Expression = [Token]

-- | The `tokenise` function reads a string to return a list of tokens
-- >>> tokenise "3.2 + 2.3"
-- [Num 3.2,Plus,Num 2.3]
tokenise :: String -> Expression
tokenise "" = []
tokenise (c : cs) = case c of
  '+' -> Plus : tokenise cs
  '-' -> Minus : tokenise cs
  _
    | c `elem` ['0' .. '9'] -> case reads (c : cs) of
      [(value, rest)] -> Num value : tokenise rest
      _ -> error "Could not read number"
    | c `elem` [' ', '\t'] -> tokenise cs
    | otherwise -> error "Unknown Symbol"

-- | The `showExpression` function reads a list of tokens to return a string
-- >>> showExpression [Num 3.2,Plus,Num 2.3]
-- "3.2 + 2.3"
showExpression :: Expression -> String
showExpression [] = ""
showExpression (e : es) = case e of
  Plus -> " + " ++ showExpression es
  Minus -> " - " ++ showExpression es
  Num x -> show x ++ showExpression es

-- | `evalStringExpression` evaluates a string containing a valid numberical
-- expression and returns the evaluated expression
-- >>> evalStringExpression "3.2 - 4.2 - 5.3 + 6.3"
-- "0.0"
evalStringExpression :: String -> String
evalStringExpression s = showExpression (eval (tokenise s))

-- | Write your comment about the function here
eval :: Expression -> Expression
eval = error "eval: TODO"
