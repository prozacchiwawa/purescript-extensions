module Data.JSON where

import Data.CForeign (Foreign)

foreign import stringify :: Foreign -> String
