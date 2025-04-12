import 'package:flutter/material.dart';
import 'package:animated_routes/routes/base_route.dart';

/// Mixin for fade transition
mixin FadeTransitionMixin<T> on PageRoute<T> {
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}

/// FadeRoute using FadeTransitionMixin
class FadeRoute<T> extends BaseRoute<T> with FadeTransitionMixin<T> {
  FadeRoute({required super.builder})
    : super(duration: const Duration(milliseconds: 300));
}
