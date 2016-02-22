-----------------------------------------------------------------------------
--
-- Module      :  Extensions
-- Copyright   :  2015 Jürgen Nicklisch-Franken
-- License     :  GPL 2
--
--
-- | Some extensions for purescript
--
-----------------------------------------------------------------------------

module Extensions where

import Prelude (class Monad, class Bind, Unit, map, (/), (*), (-), otherwise, negate, (<), (>), (+), (==), mod, const, (>>=))
import Data.Traversable(sequence)
import Control.Monad.Eff (Eff)
import Data.Array (range)
import Math(floor)

infixl 2 bindConst as >>

bindConst :: forall m a b. (Bind m) => m a -> m b -> m b
bindConst x y = x >>= const y

-- A range function, which only counts up like in Haskell
hRange :: Int -> Int -> Array Int
hRange a b = if a > b then [] else range a b

-- A real mod function for Ints (not a remainder like % and mod in purescript)
modInt :: Int -> Int -> Int
modInt n d    =  if signum r == negate (signum d) then r+d else r
                    where r = n `mod` d

signum :: Int -> Int
signum n | n > 0 = 1
signum n | n < 0 = -1
signum n | otherwise = 0

-- | A mod function for Floats
modFloat :: Number -> Number -> Number
modFloat n d = n - (floor (n / d)) * d

foreign import data TIMEOUT :: !

foreign import timeout :: forall eff a.
                               Int ->
                               Eff eff a ->
                               Eff eff Unit

-- Throws an error
foreign import fail :: forall a . String -> a

-- Undefined, which matches any type
foreign import undef :: forall a . a

-- Anything goes
foreign import unsafeCoerce :: forall a b. a -> b

-- Monadic map
mapM :: forall a b m. (Monad m) => (a -> m b) -> Array a -> m (Array b)
mapM f array = sequence (map f array)

-- | Map with effects over an array of values.
foreign import mapE :: forall a b e. (a -> Eff e b) -> Array a -> Eff e (Array b)

-- Should go to: Graphics.Canvas
foreign import data Image :: *

foreign import alert :: forall eff. String -> Eff eff Unit
