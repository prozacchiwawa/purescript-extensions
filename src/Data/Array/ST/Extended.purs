module Data.Array.ST.Extended where

import Control.Monad.Eff
import Control.Monad.ST (ST())
import Data.Array.ST

foreign import runSTArrays """
  function runSTArrays(f) {
    return f;
  }""" :: forall a r. (forall h. Eff (st :: ST h | r) [STArray h a]) -> Eff r [[a]]
