import IO.hs

-- 2D cellular automaton, similar to Conway's Game of Life.
type Board = [String]

gameBoard :: Board        -- Default game board.
gameBoard = ["..........",
             "..........",
             "..........",
             "..........",
             "..........",
             "..........",
             "..........",
             "..........",
             "..........",
             ".........."
            ]

-- Takes a board and the index to check and returns the number of neighbours that index has.
countNeighbours :: Board -> Int -> Int
countNeighbours board ind =
