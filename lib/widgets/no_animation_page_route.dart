import 'package:haumsung_web/widgets/transition.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter/material.dart';

class NoAnimationPage<T> extends TransitionPage<T> {
  NoAnimationPage({required Widget child})
      : super(
    child: child,
    pushTransition: PageTransition.none,
    popTransition: PageTransition.none,
  );
}