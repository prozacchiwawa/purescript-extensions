-----------------------------------------------------------------------------
--
-- Module      :  Data.Array.Extended
-- Copyright   :
-- License     :  Apache
--
--
-- | Extension for purescript array
--
-----------------------------------------------------------------------------

module Data.Array.Extended where

import Data.Array

-- The slice method returns the selected elements in an array, as a new array object.
-- It selects the elements starting at the given (1based) start argument, and ends at,
-- but does not include, the given end argument.

foreign import slice
  "function slice (s) {\
  \  return function (e) {\
  \    return function (l) {\
  \      return l.slice(s, e);\
  \    };\
  \  };\
  \}" :: forall a. Number -> Number -> [a] -> [a]
