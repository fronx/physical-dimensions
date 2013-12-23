{-# LANGUAGE FlexibleInstances #-} -- for Show instances

module OneDim where

import Prelude hiding
  ((+), (*))
import qualified Prelude as P
  ((+), (*))
import TypeNums

-- there is only one dimension: len(gth)
-- len is a phantom type!!
data Unit len a = Unit a

type Length = T1
type Area   = T2
type Volume = T3

(+) :: Num a => Unit len a ->
                Unit len a ->
                Unit len a
(Unit x) + (Unit y) = Unit (x P.+ y)

-- construct a quantity from a number and a unit
(*~) :: Num a => a ->
                 Unit l a ->
                 Unit l a
x *~ (Unit y) = Unit (x P.* y)

meter :: Num a => Unit Length a
meter = Unit 1

meter2 :: Num a => Unit Area a
meter2 = Unit 1

instance Show a => Show (Unit Length a) where
  show (Unit x) = (show x) ++ " m"
instance Show a => Show (Unit Area a) where
  show (Unit x) = (show x) ++ " m^2"
instance Show a => Show (Unit Volume a) where
  show (Unit x) = (show x) ++ " m^3"

main = do
  let x = 1.2 *~ meter
  let y = 2.3 *~ meter2
  print x
  print y
  print (x + x)
  -- print (x + y) -- doesn't work!
