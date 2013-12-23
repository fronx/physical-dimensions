{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-} -- bc "Nested type family application"

module TypeNums where

data Zero
data Succ a
data Pred a

type family Incr a
type instance Incr Zero = Succ Zero
type instance Incr (Succ a) = (Succ (Succ a))
type instance Incr (Pred a) = a

type family Add a b
type instance Add Zero b = b
type instance Add (Succ a) b = Add a (Incr b)
type instance Add (Pred a) b = Add (Incr a) b

-- convenience aliases
type T0    = Zero
type T1    = Succ T0
type T2    = Succ T1
type T3    = Succ T2
type TNeg1 = Pred T0
type TNeg2 = Pred TNeg1
type TNeg3 = Pred TNeg2
