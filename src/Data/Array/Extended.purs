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


-- elem is the list membership predicate, usually written in infix form, e.g., x `elem` xs.
elem :: forall a. (Eq a) => a -> [a] -> Boolean
elem e a = elemIndex e a /= -1
