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

import Prelude
import Data.Traversable(sequence)
import Control.Monad.Eff
import Data.Maybe.Unsafe(fromJust)
import Data.Int
import Math(round)

-- Throws an error
foreign import fail :: forall a . String -> a

-- Undefined, which matches any type
foreign import undef :: forall a . a

-- Trace or log for pure code
foreign import unsafeTrace :: forall a. String -> a -> a

-- Anything goes
foreign import unsafeCoerce :: forall a b. a -> b

-- Monadic map
mapM :: forall a b m. (Monad m) => (a -> m b) -> Array a -> m (Array b)
mapM f array = sequence (map f array)

-- | Map with effects over an array of values.
foreign import mapE :: forall a b e. (a -> Eff e b) -> Array a -> Eff e (Array b)

-- Should go to Data.Int
minInt :: Int -> Int -> Int
minInt a b | a < b = a
           | otherwise = b

round' :: Number -> Int
round' = fromJust <<< fromNumber <<< round

-- Should go to: Graphics.Canvas
foreign import data Image :: *
