import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlipTransition extends AnimatedWidget {
  FlipTransition({
    Key? key,
    required Animation<double> animation,
    required this.child,
    bool isEntry = true,
  })  : offsetXTween = Tween<double>(begin: isEntry ? -15 : 15, end: 2),
        scaleSequence = TweenSequence(
          <TweenSequenceItem<double>>[
            TweenSequenceItem(
                tween: Tween<double>(begin: beginScale, end: endScale)
                    .chain(CurveTween(curve: Curves.easeIn)),
                weight: 40),
            TweenSequenceItem(
                tween: ConstantTween<double>(endScale), weight: 60),
          ],
        ),
        rotateSequence = TweenSequence(<TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
              tween: ConstantTween(isEntry ? endRotation : beginRotation)
                  .chain(CurveTween(curve: Curves.ease)),
              weight: 60),
          TweenSequenceItem<double>(
              tween: Tween<double>(
                      begin: isEntry ? endRotation : beginRotation,
                      end: midRotation)
                  .chain(CurveTween(
                      curve: isEntry ? Curves.easeIn : Curves.easeOut)),
              weight: 40),
        ]),
        super(key: key, listenable: animation);

  final Widget child;

  static const double beginScale = 1;
  static const double endScale = 1.8;
  static const double beginRotation = 0;
  static const double midRotation = math.pi / 2;
  static const double endRotation = math.pi;

  final TweenSequence<double> scaleSequence;
  final TweenSequence<double> rotateSequence;

  final Tween<double> offsetXTween;
  final Tween<double> spreadTween = Tween<double>(begin: 5, end: 0);
  final Tween<double> blurTween = Tween<double>(begin: 10, end: 0);
  final Tween<double> offsetYTween = Tween<double>(begin: 10, end: 0);

  Animation<double> get scale =>
      scaleSequence.animate(listenable as Animation<double>);
  Animation<double> get rotation =>
      rotateSequence.animate(listenable as Animation<double>);
  Animation<double> get shadowSpread => spreadTween.animate(CurvedAnimation(
      parent: listenable as Animation<double>, curve: Curves.easeIn));
  Animation<double> get blur => blurTween.animate(CurvedAnimation(
      parent: listenable as Animation<double>, curve: Curves.easeIn));
  Animation<double> get offsetX => offsetXTween.animate(CurvedAnimation(
      parent: listenable as Animation<double>, curve: Curves.easeInOut));
  Animation<double> get offsetY => offsetYTween.animate(CurvedAnimation(
      parent: listenable as Animation<double>, curve: Curves.easeInOut));

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(color: Colors.grey[200]),
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 3, scale.value)
            ..setEntry(3, 2, -0.001)
            ..rotateY(rotation.value),
          origin: Offset(size.width / 2, size.height / 2),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: blur.value,
                  spreadRadius: shadowSpread.value,
                  offset: Offset(
                    offsetX.value,
                    offsetY.value,
                  ),
                ),
              ],
            ),
            child: RotationY(
              rotationY: rotation.value >= math.pi / 2 ? 180 : 0,
              child: FadeTransition(
                opacity: ReverseAnimation(listenable as Animation<double>),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RotationY extends StatelessWidget {
  const RotationY({
    Key? key,
    required this.child,
    this.rotationY = 0,
  }) : super(key: key);

  static const double degree2Radians = math.pi / 180;

  final Widget child;
  final double rotationY;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, -0.001)
        ..rotateY(rotationY * degree2Radians),
      child: child,
    );
  }
}
