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
import Control.Monad.Eff



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

foreign import unsafeCoerce
    "function unsafeCoerce(x) {\
    \ return x;\
    \}" :: forall a b. a -> b

mapM :: forall a b m. (Monad m) => (a -> m b) -> [a] -> m [b]
mapM f array = sequence (map f array)

-- | Map with effects over an array of values.
foreign import mapE
    """
    function mapE(f) {
      return function(arr) {
        return function() {
          var res = new Array(arr.length);
          for (var i = 0; i < arr.length; i++) {
            res[i] = f(arr[i])();
          }
          return res;
        };
      };
    }
    """ :: forall a b e. (a -> Eff e b) -> [a] -> Eff e [b]
