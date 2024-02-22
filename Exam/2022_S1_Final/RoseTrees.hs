module RoseTrees where

-- Note that there are TWO functions for you to complete in this file.
-- It is NOT necessary to complete the first function
-- before attempting the second.

-- Type definition. DO NOT DELETE OR EDIT IT.
-- You may add deriving statements.

data Rose a = Rose a [Rose a]

-- | maxBranch:
--
-- The branching factor of a node in a Rose tree
-- is its number of children.
--
-- Given a Rose Tree as input,
-- return the maximum branching factor
-- of any node in the tree.
--
-- Examples:
--
-- >>> maxBranch (Rose 1 [])
-- 0
--
-- >>> maxBranch (Rose 1 [Rose 2 [Rose 4 []],Rose 3 [Rose 5 [],Rose 6 [],Rose 7 []]])
-- 3

maxBranch :: Rose a -> Int
maxBranch = undefined

-- | shortestWord:
--
-- Given a Rose Tree of Chars as input,
-- let a word be a String whose first character is the root,
-- second character is a child of the root,
-- and so on, until its last character is a leaf.
--
-- Return the shortest word.
-- If more than one word has length equal to the shortest,
-- return the shortest word that is most to the left of the tree.
--
-- Examples:
--
-- >>> shortestWord (Rose 'a' [])
-- "a"
--
-- >>> shortestWord (Rose 'a' [Rose 'b' [],Rose 'c' []])
-- "ab"
--
-- >>> shortestWord (Rose 'a' [Rose 'b' [Rose 'd' []],Rose 'c' []])
-- "ac"

shortestWord :: Rose Char -> String
shortestWord = undefined