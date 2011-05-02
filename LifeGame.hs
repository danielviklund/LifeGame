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

-- Generator loop. Generates the cellular automata. Recursive function.
genLoop :: Int -> Generation -> Generation
genLoop 0 gen = "\n"  -- Base case.
genLoop x gen = (applyRules gen rules (length gen)) ++ "\n" ++ (genLoop (x - 1) (applyRules gen rules (length gen)))

-- Applies rules to a Generation (which could be the seed) to produce a new nested list of strings ([Char]), i.e. a new "Generation".
applyRules :: Generation -> Rules -> Int -> Generation
applyRules gen rules lnth
        | (length gen) == lnth                                    = (head gen):[] ++ (applyRules gen rules (lnth - lnth)) -- Hack to make the first run apply the head and then go to the default.
        | (length gen) == 3                                       = [] ++ (tail gen)                                      -- Just output the chars.
        | lnth == 0                                               = [] ++ (returnRule (take 3 gen) rules) ++ (applyRules (drop 1 gen) rules (length gen)) -- Defaults.
        | otherwise                                               = [] ++ (returnRule (take 3 gen) rules) ++ (applyRules (drop 1 gen) rules (length gen)) -- Defaults.

-- returnRule matches the given pattern, ptrn, with the appropriate rule.
returnRule :: String -> Rules -> String
returnRule ptrn rls = head (head [tail x | x <- rls, ptrn == (head x)])
