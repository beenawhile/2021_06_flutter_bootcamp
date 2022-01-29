import 'package:animation_course/0_widgets/1_demo_page.dart';
import 'package:animation_course/101_implicit_animation_practice/1_animated_container.dart';
import 'package:animation_course/101_implicit_animation_practice/2_animated_cross_fade.dart';
import 'package:animation_course/101_implicit_animation_practice/3_animated_physical_model.dart';
import 'package:animation_course/101_implicit_animation_practice/4_animated_opacity.dart';
import 'package:animation_course/101_implicit_animation_practice/5_default_text_style.dart';
import 'package:animation_course/101_implicit_animation_practice/6_animated_alignment.dart';
import 'package:animation_course/101_implicit_animation_practice/7_animated_controller.dart';
import 'package:flutter/material.dart';

class ImplicitAnimationPracticePage extends StatelessWidget {
  const ImplicitAnimationPracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        DemoPage(
          title: "Animated Container",
          child: AnimatedContainerPracticePage(),
        ),
        DemoPage(
          title: "Animated Cross Fade",
          child: AnimatedCrossFadePracticePage(),
        ),
        DemoPage(
          title: "Animated Physical Model",
          child: AnimatedPhysicalModelPracticePage(),
        ),
        DemoPage(
          title: "Animated Opacity",
          child: AnimatedOpacityPracticePage(),
        ),
        DemoPage(
          title: "Animated TextStyle",
          child: DefaultTextStylePracticePage(),
        ),
        DemoPage(
          title: "Animated Alignment",
          child: AnimatedAlignmentPracticePage(),
        ),
        DemoPage(
          title: "Animated Controller",
          child: AnimationControllerExample(),
        )
      ],
    );
  }
}
