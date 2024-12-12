import 'dart:math';

import 'package:flutter/material.dart';

class FlipAnimation extends StatelessWidget {
  final Widget front;
  final Widget back;
  final bool showBack;
  final Duration duration;

  const FlipAnimation({
    super.key,
    required this.front,
    required this.back,
    required this.showBack,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
        return AnimatedBuilder(
          animation: rotateAnim,
          child: child,
          builder: (context, child) {
            final isUnder = (ValueKey(showBack) != child?.key);
            var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
            tilt *= isUnder ? -1.0 : 1.0;
            return Transform(
              transform: Matrix4.rotationY(rotateAnim.value)..setEntry(3, 0, tilt),
              alignment: Alignment.center,
              child: child,
            );
          },
        );
      },
      child: showBack
          ? KeyedSubtree(key: const ValueKey(true), child: back)
          : KeyedSubtree(key: const ValueKey(false), child: front),
    );
  }
}