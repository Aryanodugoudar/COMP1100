module ListElements where

-- write a function 'listElements'  such that 'listElements i j xs' returns
-- a list of elements of xs starting at 'i' (list-indexes count up from 0!) 
-- and up to, and including, the element at index 'j'.
--
-- If the first index is greater than the second, return the elements in
-- reverse order.
--
-- If an index is equal to or greater than the list length, treat it
-- as the greatest valid index into the list (i.e length xs - 1).
--
-- Finally, if an index is negative, start counting from the back of the list
-- again, treating an index (whose absolute value) is that too high as the 
-- appropriate end of the list.
--
-- see the Doctests for examples!
--
-- | Manipulating elements of a list.
--
-- >>> listElements 1 3 "abcdef"
-- "bcd"
--
-- >>> listElements 2 2 "abcdef"
-- "c"
--
-- >>> listElements 2 0 "abcdef"
-- "cba"
--
-- >>> listElements 10 2 "abcdef"
-- "fedc"
--
-- >>> listElements (-2) (-4) "abcdef"
-- "edc"
--
-- >>> listElements (-3) 10 "abcdef"
-- "def"
--
-- >>> listElements (-10) 3 "abcdef"
-- "abcd"
--
-- >>> listElements 3 (-10) "abcdef"
-- "dcba"

listElements :: Int -> Int -> [a] -> [a]
listElements a b list
    | a >= length list = reverse (take (length list) (drop (length list - 1) list))
    | b >= length list = take (length list) (drop a list)
    | a < 0 = reverse (take (abs a) (drop (length list - abs a) list))
    | otherwise = take (b - a + 1) (drop a list)



  


