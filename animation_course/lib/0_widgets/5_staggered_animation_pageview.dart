import 'package:animation_course/0_widgets/1_demo_page.dart';
import 'package:animation_course/4_staggered_animation/1_staggered_animation/1_staggered_animation.dart';
import 'package:animation_course/4_staggered_animation/page.dart';
import 'package:flutter/material.dart';

class StaggeredAnimationPageView extends StatelessWidget {
  const StaggeredAnimationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        DemoPage(
          title: "Staggered Animation",
          child: StaggeredAnimationExample(),
        ),
        DemoPage(
          title: "SignIn Animation",
          child: NavigateToSigninPage(),
        ),
      ],
    );
  }
}
