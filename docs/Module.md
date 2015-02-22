# Module Documentation

## Module Control.Monad.Eff.Alert

### Types

#### `Alert`

    data Alert :: !


### Values

#### `alert`

    alert :: forall eff. String -> Eff (alert :: Alert | eff) Unit


## Module Extensions

### Values

#### `fail`

    fail :: forall a. String -> a

#### `undef`

    undef :: forall a. a

#### `unsafeTrace`

    unsafeTrace :: forall a. String -> a -> a