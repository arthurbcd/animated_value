import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'lerp_tween.dart';

/// An implicitly animated widget that rebuilds when the given value changes.
class AnimatedValue<T> extends ImplicitlyAnimatedWidget {
  /// Creates an implicitly animated value.
  ///
  /// You can either provide a [child] or a [builder] that will be evaluated
  /// with the animated value.
  ///
  /// By default, the theme transition uses a linear curve. The [value] and
  /// [builder] arguments must not be null.
  const AnimatedValue({
    super.key,
    super.curve,
    super.duration = const Duration(milliseconds: 200),
    super.onEnd,
    required this.value,
    this.lerp,
    this.builder,
    this.child,
  }) : assert(
          child != null || builder != null,
          'You must provide a child or builder.',
        );

  /// Specifies the color and typography values for descendant widgets.
  final T value;

  /// The lerp function to override.
  final LerpCallback<T>? lerp;

  /// The builder with evaluated animated value.
  final ValueWidgetBuilder<T>? builder;

  /// The [Widget] below [AnimatedValue].
  ///
  /// If [builder] is not null, the child will be passed to the builder.
  /// If [builder] is null, the child will be returned directly.
  final Widget? child;

  @override
  AnimatedWidgetBaseState<AnimatedValue<T>> createState() =>
      _AnimatedLerperState<T>();
}

class _AnimatedLerperState<T>
    extends AnimatedWidgetBaseState<AnimatedValue<T>> {
  Tween<T>? _value;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _value = visitor(
      _value,
      widget.value,
      (value) {
        if (widget.lerp == null) return Tween<T>(begin: value as T);
        return LerpTween<T>(begin: value as T, lerp: widget.lerp!);
      },
    ) as Tween<T>?;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder?.call(
          context,
          _value?.evaluate(animation) as T,
          widget.child,
        ) ??
        widget.child!;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(
      DiagnosticsProperty<Tween<T>>(
        '_value',
        _value,
        showName: false,
        defaultValue: null,
      ),
    );
  }
}
