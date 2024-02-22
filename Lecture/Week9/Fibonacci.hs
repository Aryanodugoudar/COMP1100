module Fibonacci where

fastFib :: [Integer]
fastFib = 0 : 1 : zipWith (+) fastFib (tail fastFib)

slowFib :: Integer -> Integer
slowFib n
  | n <= 0    = 0
  | n == 1    = 1
  | otherwise = slowFib (n-1) + slowFib (n-2)