import 'dart:async';

import 'package:animation_course/6_routes/ux/pages/learn_more_page.dart';
import 'package:animation_course/6_routes/ux/transitions/flip_transition.dart';
import 'package:animation_course/6_routes/ux/widgets/binary_background.dart';
import 'package:animation_course/6_routes/ux/widgets/learn_more_button/learn_more_button.dart';
import 'package:animation_course/6_routes/ux/widgets/zoom_page_view.dart';
import 'package:animation_course/main.dart';
import 'package:flutter/material.dart';

class HomeRoutePage extends StatefulWidget {
  const HomeRoutePage({Key? key}) : super(key: key);

  @override
  _HomeRoutePageState createState() => _HomeRoutePageState();
}

class _HomeRoutePageState extends State<HomeRoutePage>
    with SingleTickerProviderStateMixin, RouteAware {
  static const double _viewPortFraction = 0.5;
  static const int _initialPage = 2;
  static const _transitionDuration = Duration(milliseconds: 850);

  final ValueNotifier<double> _valueNotifier = ValueNotifier(0.5);

  late PageController _pageController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _transitionDuration);
    _pageController = PageController(
        initialPage: _initialPage, viewportFraction: _viewPortFraction);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void didPush() {
    debugPrint("Push");
    super.didPush();
  }

  @override
  void didPushNext() {
    debugPrint("Push Next");
    super.didPushNext();
  }

  @override
  void didPopNext() {
    debugPrint("Pop Next");
    if (!(_animationController.value > 0)) {
      return;
    }
    Timer(
      _transitionDuration,
      () {
        _animationController.reverse(from: 1);
      },
    );
    super.didPopNext();
  }

  @override
  void didPop() {
    debugPrint("Pop");
    super.didPop();
  }

  void _onTransitionPressed() {
    _animationController.forward(from: 0).whenComplete(_transitionRoute);
  }

  void _transitionRoute() {
    Navigator.of(context).push<dynamic>(_createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: _transitionDuration,
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LearnMorePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FlipTransition(
          animation: ReverseAnimation(animation),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlipTransition(
      isEntry: false,
      animation: _animationController,
      child: Scaffold(
        body: Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: _valueNotifier,
              builder: (BuildContext context, double value, Widget? child) {
                return BinaryBackground(value: _valueNotifier.value);
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ZoomPageScroll(
                  pageController: _pageController,
                  value: _valueNotifier,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: LearnMoreButton(onPressed: _onTransitionPressed),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
