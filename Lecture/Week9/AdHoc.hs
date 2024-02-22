module AdHoc where

data Supermarket = Coles | Woolworths | Other String
--  deriving Eq

instance Eq Supermarket where

  s == t = case (s,t) of
    (Coles,Coles) -> True
    (Woolworths,Woolworths) -> True
    (Other name1,Other name2) -> name1 == name2
    (Coles,Other "Coles") -> True
    (Other "Coles",Coles) -> True
    (Woolworths,Other "Woolworths") -> True
    (Other "Woolworths",Woolworths) -> True
    _ -> False

myElem :: Eq a => a -> [a] -> Bool
myElem val list = case list of
  []   -> False
  x:xs -> val == x || myElem val xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' val = foldr (\x b -> val == x || b) False