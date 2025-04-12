import 'package:flutter/material.dart';
import 'package:animated_routes/routes/base_route.dart';

/// Mixin for slide transition
mixin SlideTransitionMixin<T> on PageRoute<T> {
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(position: offsetAnimation, child: child);
  }
}

/// SlideRoute using SlideTransitionMixin
class SlideRoute<T> extends BaseRoute<T> with SlideTransitionMixin<T> {
  SlideRoute({required super.builder})
    : super(duration: const Duration(milliseconds: 300));
}
