import 'package:animation_course/0_widgets/101_implicit_animation_pageview.dart';
import 'package:animation_course/0_widgets/5_staggered_animation_pageview.dart';
import 'package:animation_course/5_more_animations/providers/theme_change_notifier.dart';
// import 'package:animation_course/5_more_animations/ux/pages/animated_list_page.dart';
// import 'package:animation_course/5_more_animations/ux/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '0_widgets/widgets.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final theme = ref.watch(themeProvider);
      return MaterialApp(
        title: 'Animation Bootc amp',
        // theme: theme.darkMode ? darkTheme : lightTheme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course outputs list'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ImplicitAnimationPageView(),
                ));
              },
              child: const Text("1. Implicit Animation Widgets")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ImplicitAnimationPracticePage(),
                ));
              },
              child: const Text("1-1. Implicit Animation Widgets Practice")),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ExplicitAnimationPageView(),
                ));
              },
              child: const Text("2. Explicit Animation Widgets")),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () {}, child: const Text("3. Tween Curve Widgets")),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StaggeredAnimationPageView(),
                ));
              },
              child: const Text("4. Staggered Animation")),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => const AnimatedListPage(),
          //       ));
          //     },
          //     child: const Text("5. More Animation")),
        ],
      )),
    );
  }
}
