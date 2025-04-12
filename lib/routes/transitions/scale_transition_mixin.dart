import 'package:flutter/material.dart';
import 'package:animated_routes/routes/base_route.dart';

/// Mixin for scale transition
mixin ScaleTransitionMixin<T> on PageRoute<T> {
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ScaleTransition(scale: animation, child: child);
  }
}

/// ScaleRoute using ScaleTransitionMixin
class ScaleRoute<T> extends BaseRoute<T> with ScaleTransitionMixin<T> {
  ScaleRoute({required super.builder})
    : super(duration: const Duration(milliseconds: 300));
}
