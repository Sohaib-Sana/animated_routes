import 'package:animated_routes/routes/transitions/fade_transition_mixin.dart';
import 'package:animated_routes/routes/transitions/scale_transition_mixin.dart';
import 'package:flutter/material.dart';
import 'package:animated_routes/routes/transitions/slide_transition_mixin.dart';

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
}
