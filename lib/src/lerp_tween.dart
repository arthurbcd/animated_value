import 'package:flutter/widgets.dart';

/// A [Tween] that interpolates between two values using a provided [LerpCallback].
class LerpTween<T> extends Tween<T> {
  /// Creates a [LerpTween] with the given [begin] and [end] values.
  LerpTween({
    super.begin,
    super.end,
    required LerpCallback<T> lerp,
  }) : _lerp = lerp;

  final LerpCallback<T> _lerp;

  @override
  T lerp(double t) => _lerp(begin, end, t);
}

/// A callback that interpolates between two values.
typedef LerpCallback<T> = T Function(T? begin, T? end, double t);
