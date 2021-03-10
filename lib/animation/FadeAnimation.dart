import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track("opacity")
    //       .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(
    //       Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
    //       curve: Curves.easeOut),
    // ]);

    // return ControlledAnimation(
    //   delay: Duration(milliseconds: (500 * delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation["opacity"],
    //     child: Transform.translate(
    //       offset: Offset(0, animation["translateY"]),
    //       child: child,
    //     ),
    //   ),
    // );
    return PlayAnimation<double>(
      tween: (-140.0).tweenTo(0.0),
      duration: Duration(milliseconds: (400 * delay).round()),
      curve: Curves.easeOut,
      builder: (context, child, value) {
        return Transform.translate(
          offset: Offset(0,value),
          child: child
          );
      },
      child: child,
    );
  }
}
