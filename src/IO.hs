module IO where

import LifeGame

-- The print-out of the board.
printBoard :: Board -> IO ()
printBoard []     = putStr ""
printBoard (x:xs) = do putStr x
                       printBoard xs
