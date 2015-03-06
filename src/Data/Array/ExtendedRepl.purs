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

module Data.Array.ExtendedRepl where

import Data.Array

-- Creates a list of length given by the first argument and the items having value of the second argument
foreign import replicate
"""
function replicate(len) {
  return function (val) {
    var rv = new Array(len);
    while (--len >= 0) {
        rv[len] = val;
    };
    return rv;
  };
}
""" :: forall a. Number -> a -> [a]

-- elem is the list membership predicate, usually written in infix form, e.g., x `elem` xs.
elem :: forall a. (Eq a) => a -> [a] -> Boolean
elem e a = elemIndex e a /= -1
