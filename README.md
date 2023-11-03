# animated_value

The `animated_value` package provides a simple and flexible way to animate values in Flutter. It uses a custom `lerp` (linear interpolation) function or a custom builder function to create smooth animations with ease.

It's all implicit! Just change the value like you would do in an `AnimatedContainer`.

## Usage

Here's a basic example of how to use the AnimatedValue widget to animate a `ButtonStyle`:

```dart
  AnimatedValue<ButtonStyle?>(
    // the value to animate
    value: condition ? buttonStyle1 : buttonStyle2,

    // optional `lerp()` for complex objects
    lerp: ButtonStyle.lerp,

    // rebuilds on animation
    builder: (context, value, _) {
      return ElevatedButton(
        style: value,
        child: Text('easy animated style!'),
      );
    },
  )
```

## Custom Interpolation with LerpTween and LerpCallback

`animated_value` provides the `LerpTween` class and `LerpCallback` type for custom interpolation between two values. Here's a brief explanation and usage example:

```dart
final tween = LerpTween(
    begin: ...,
    end: ...,
    lerp: AppBarTheme.lerp,
);
```

## Extension Methods

The `animated_value` package also provides extension methods for the `LerpCallback` class, allowing for easier creation of `LerpTween` objects. Here's an example of how you can use these extension methods:

```dart
final tween = AppBarTheme.lerp.tween(begin: ..., end: ...);
```
