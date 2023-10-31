import 'package:flutter/animation.dart';

import '../lerp_tween.dart';

/// Extension methods for the [LerpCallback] class.
extension TweenExtension<T> on LerpCallback<T> {
  /// Creates a [LerpTween] with the given [begin] and [end] values.
  Tween<T> tween(T? begin, T? end) {
    return LerpTween<T>(
      begin: begin,
      end: end,
      lerp: (begin, end, t) => this(begin, end, t),
    );
  }
}
