import 'package:flutter/material.dart';

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
