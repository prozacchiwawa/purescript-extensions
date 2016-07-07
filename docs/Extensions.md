## Module Extensions

Some extensions for purescript

#### `(>>)`

``` purescript
infixl 2 bindConst as >>
```

#### `bindConst`

``` purescript
bindConst :: forall m a b. Bind m => m a -> m b -> m b
```

#### `hRange`

``` purescript
hRange :: Int -> Int -> Array Int
```

#### `modInt`

``` purescript
modInt :: Int -> Int -> Int
```

#### `signum`

``` purescript
signum :: Int -> Int
```

#### `modFloat`

``` purescript
modFloat :: Number -> Number -> Number
```

A mod function for Floats

#### `replicateM`

``` purescript
replicateM :: forall m a. Monad m => Int -> m a -> m (Array a)
```

Perform a monadic action `n` times collecting all of the results.

#### `TIMEOUT`

``` purescript
data TIMEOUT :: !
```

#### `timeout`

``` purescript
timeout :: forall eff a. Int -> Eff eff a -> Eff eff Unit
```

#### `fail`

``` purescript
fail :: forall a. String -> a
```

#### `undef`

``` purescript
undef :: forall a. a
```

#### `unsafeCoerce`

``` purescript
unsafeCoerce :: forall a b. a -> b
```

#### `mapM`

``` purescript
mapM :: forall a b m. Monad m => (a -> m b) -> Array a -> m (Array b)
```

#### `mapE`

``` purescript
mapE :: forall a b e. (a -> Eff e b) -> Array a -> Eff e (Array b)
```

Map with effects over an array of values.

#### `mapE_`

``` purescript
mapE_ :: forall a e. (a -> Eff e Unit) -> Array a -> Eff e Unit
```

Map with effects over an array of values. Doesn't return a value

#### `mapEBreak`

``` purescript
mapEBreak :: forall a b e. (a -> Eff e b) -> (Int -> Eff e Boolean) -> Array a -> Eff e (Array b)
```

Map with effects over an array of values. Calls a break function on every iteration with the index.

#### `mapEBreak_`

``` purescript
mapEBreak_ :: forall a e. (a -> Eff e Unit) -> (Int -> Eff e Boolean) -> Array a -> Eff e Unit
```

Map with effects over an array of values. Calls a break function on every iteration with the index.

#### `replicate`

``` purescript
replicate :: forall a. Int -> a -> Array a
```

Create an array with repeated instances of a value.

#### `Image`

``` purescript
data Image :: *
```

#### `alert`

``` purescript
alert :: forall eff. String -> Eff eff Unit
```


