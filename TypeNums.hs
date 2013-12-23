module TypeNums where

data Zero
data Succ a
data Pred a

-- convenience aliases
type T0    = Zero
type T1    = Succ T0
type T2    = Succ T1
type T3    = Succ T2
type TNeg1 = Pred T0
type TNeg2 = Pred TNeg1
type TNeg3 = Pred TNeg2
