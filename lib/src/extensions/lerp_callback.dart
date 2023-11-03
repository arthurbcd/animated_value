import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../lerp_tween.dart';

/// Extension methods for the [LerpCallback] class.
extension TweenExtension<T extends R, R> on R Function(T? a, T? b, double t) {
  /// Creates a [LerpTween] with the given [begin] and [end] values.
  Tween<R> tween([T? begin, T? end]) {
    return LerpTween<R>(
      begin: begin,
      end: end,
      lerp: (a, b, t) => this(a as T?, b as T?, t),
    );
  }
}
