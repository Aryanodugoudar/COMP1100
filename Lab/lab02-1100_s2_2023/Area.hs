module Area where
    addone :: Int -> Int
    addone int=int+1

    areaSquare :: Integer -> Integer
    areaSquare len = len*len

    arearect :: Int -> Int -> Int
    arearect b h= b*h 

    areaSquareDouble :: Double -> Double
    areaSquareDouble len = len*len

    arearectDouble :: Double -> Double -> Double
    arearectDouble b h= b*h 

    areaTriangle :: Float -> Float -> Float -> Float
    areaTriangle a b c = sqrt(s*(s-a)*(s-b)*(s-c))
        where 
            s = (a+b+c)/2