module Solutions
    ( helloWorld
    , facRecursive
    , sumdown
    , (^)
    , euclid
    , and
    , concat
    , replicate
    , (!!)
    , elem
    ) where

-- Allows us to avoid a namespace conflict with our own implementation
import Prelude hiding
    ( (^)
    , and
    , concat
    , replicate
    , (!!)
    , elem
    )

-- #1
facRecursive :: Int -> Int
facRecursive n
    | n < 0     = 0
    | n == 0    = 1
    | otherwise = n * facRecursive (n - 1)

-- #2
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n - 1)

-- #3
-- Assumes that the answer is computable; no 0^0
(^) :: Int -> Int -> Int
0 ^ _ = 0
_ ^ 0 = 1
n ^ m = n * (n ^ (m - 1))

-- #4
euclid :: Int -> Int -> Int
euclid n m 
    | n == m = n
    | n >  m = euclid m (n - m)
    | n <  m = euclid n (m - n)

-- #6 Part a
and :: [Bool] -> Bool
and []  = False
and [x] = x
and (x:xs)
    | x == False = False
    | x == True  = and xs

-- #6 Part b
concat :: [[a]] -> [a]
concat  []  = []
concat (xs:xss) = xs ++ concat xss

-- #6 Part c
replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate 1 a = [a]
replicate n a = [a] ++ replicate (n - 1) a

-- #6 Part d
-- For simplicity, assume that the index is valid and that
-- the array is non-empty
(!!) :: [a] -> Int -> a
(x:xs) !! 0 = x
(x:xs) !! n = xs !! (n - 1)

-- #6 Part e
elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
-- Note: ys can be [] which is why (y:ys) matches singletons
elem x (y:ys)
    | x == y = True
    | x /= y = elem x ys

helloWorld :: IO ()
helloWorld = putStrLn "Hello world"
