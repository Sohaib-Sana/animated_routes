import 'package:flutter/material.dart';

/// TransitionType enum (optional use for scalability)
enum TransitionType { slide, fade, scale, combo }

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

/// Abstract BaseRoute class to reduce boilerplate
abstract class BaseRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;
  final Duration duration;

  BaseRoute({required this.builder, required this.duration, super.settings});

  @override
  bool get opaque => true;

  @override
  bool get barrierDismissible => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => duration;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) => builder(context);
}

/// SlideRoute using SlideTransitionMixin
class SlideRoute<T> extends BaseRoute<T> with SlideTransitionMixin<T> {
  SlideRoute({required super.builder})
    : super(duration: const Duration(milliseconds: 300));
}

/// FadeRoute using FadeTransitionMixin
class FadeRoute<T> extends BaseRoute<T> with FadeTransitionMixin<T> {
  FadeRoute({required super.builder})
    : super(duration: const Duration(milliseconds: 300));
}

/// ScaleRoute using ScaleTransitionMixin
class ScaleRoute<T> extends BaseRoute<T> with ScaleTransitionMixin<T> {
  ScaleRoute({required super.builder})
    : super(duration: const Duration(milliseconds: 300));
}

/// ComboRoute using both fade + scale
class ComboRoute<T> extends BaseRoute<T> {
  ComboRoute({required super.builder})
    : super(duration: const Duration(milliseconds: 500));

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
        child: child,
      ),
    );
  }
}

/// Extension on BuildContext for clean navigation
extension NavigatorExtension on BuildContext {
  Future<T?> slideToPage<T>(Widget page) {
    return Navigator.of(this).push<T>(SlideRoute<T>(builder: (_) => page));
  }

  Future<T?> fadeToPage<T>(Widget page) {
    return Navigator.of(this).push<T>(FadeRoute<T>(builder: (_) => page));
  }

  Future<T?> scaleToPage<T>(Widget page) {
    return Navigator.of(this).push<T>(ScaleRoute<T>(builder: (_) => page));
  }

  Future<T?> comboToPage<T>(Widget page) {
    return Navigator.of(this).push<T>(ComboRoute<T>(builder: (_) => page));
  }
}
