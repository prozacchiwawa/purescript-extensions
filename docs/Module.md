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