module Para where

listInt :: [Int]
listInt = [1, 4,2, 3, 4, 45, 35,345, 11]

listChar :: [Char]
listChar = ['a', 'b', 'D', '!', ':', ';', 'R']

myZip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
myZip3 list1 list2 list3 = case (list1, list2, list3) of
    ([], _, _)         -> []
    (_, [], _)         -> []
    (_, _, [])         -> []
    (x:xs, y:ys, z:zs) -> (x,y,z) : (myZip3 xs ys zs)
