# Module Documentation

## Module Control.Monad.Eff.Alert

#### `Alert`

``` purescript
data Alert :: !
```


#### `alert`

``` purescript
alert :: forall eff. String -> Eff (alert :: Alert | eff) Unit
```



## Module Data.Array.ExtendedRepl

#### `replicate`

``` purescript
replicate :: forall a. Number -> a -> [a]
```

#### `elem`

``` purescript
elem :: forall a. (Eq a) => a -> [a] -> Boolean
```


## Module Data.Array.ST.Extended

#### `runSTArrays`

``` purescript
runSTArrays :: forall a r. (forall h. Eff (st :: ST h | r) [STArray h a]) -> Eff r [[a]]
```



## Module Extensions

#### `fail`

``` purescript
fail :: forall a. String -> a
```


#### `undef`

``` purescript
undef :: forall a. a
```


#### `unsafeTrace`

``` purescript
unsafeTrace :: forall a. String -> a -> a
```


#### `mapM`

``` purescript
mapM :: forall a b m. (Monad m) => (a -> m b) -> [a] -> m [b]
```