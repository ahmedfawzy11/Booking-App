import 'package:flutter/material.dart';

class BottomTopMoveAnimationView extends StatelessWidget {
  final AnimationController animationController;
  final Widget child;

  const BottomTopMoveAnimationView(
      {Key? key, required this.child, required this.animationController,})
      : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return AnimatedBuilder(
      animation: animationController,
      child: child,
      builder: (BuildContext context, Widget? child,) {
        return FadeTransition(
          opacity: animationController,
          
          // Fade Transition and Transform : Just for Screen Loading Animation on First Time
          
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 40 * (1.0 - animationController.value), 0.0,),
            child: child,
          ),
        );
      },
    );
  }
}
