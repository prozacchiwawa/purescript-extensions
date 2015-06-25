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



## Module Data.Array.Extended


#### `slice`

``` purescript
slice :: forall a. Number -> Number -> [a] -> [a]
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


#### `unsafeCoerce`

``` purescript
unsafeCoerce :: forall a b. a -> b
```


#### `mapM`

``` purescript
mapM :: forall a b m. (Monad m) => (a -> m b) -> [a] -> m [b]
```


#### `mapE`

``` purescript
mapE :: forall a b e. (a -> Eff e b) -> [a] -> Eff e [b]
```

Map with effects over an array of values.


## Module Graphics.Canvas.Extended


#### `Image`

``` purescript
data Image :: *
```