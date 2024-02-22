module Involutive where

-- An involution is a mathematical operation that *undoes* itself.
-- formally defined as f(f(x)) = x.
-- An involutive operation has an additional constraint that
-- f(x) cannot equal x (i.e f cannot be the identity function).

-- Complete the Involutive type class definition with an 'involute' 
-- function, giving it an appropriate polymorphic type.
class Involutive a where
  involute :: a -> a

instance Involutive Bool where
  involute True = False
  involute False = True

instance Involutive Integer where
  involute x = -x

instance Involutive [a] where
  involute = reverse

  -- your code goes here.


