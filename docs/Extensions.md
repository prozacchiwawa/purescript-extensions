## Module Extensions

Some extensions for purescript

#### `(>>)`

``` purescript
infixl 2 bindConst as >>
```

_left-associative / precedence 2_

#### `bindConst`

``` purescript
bindConst :: forall m a b. (Bind m) => m a -> m b -> m b
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
mapM :: forall a b m. (Monad m) => (a -> m b) -> Array a -> m (Array b)
```

#### `mapE`

``` purescript
mapE :: forall a b e. (a -> Eff e b) -> Array a -> Eff e (Array b)
```

Map with effects over an array of values.

#### `Image`

``` purescript
data Image :: *
```

#### `alert`

``` purescript
alert :: forall eff. String -> Eff eff Unit
```


