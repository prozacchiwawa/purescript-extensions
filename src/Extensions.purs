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

import Data.Traversable(sequence)
import Data.Array(map)



foreign import fail
"""
  function fail(s) {
      throw new Error(s);
  }
""" :: forall a . String -> a

foreign import undef
"""
  function undef() {
    throw new Error("Encountered undefined");
  }
""" :: forall a . a

foreign import unsafeTrace
"""function unsafeTrace(s) {
    return function (r) {
        console.log(s);
        return (r);
    };
  }
""" :: forall a. String -> a -> a

mapM :: forall a b m. (Monad m) => (a -> m b) -> [a] -> m [b]
mapM f array = sequence (map f array)
