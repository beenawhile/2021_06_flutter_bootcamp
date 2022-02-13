import 'package:animation_course/0_widgets/101_implicit_animation_pageview.dart';
import 'package:animation_course/0_widgets/5_staggered_animation_pageview.dart';
import 'package:animation_course/6_routes/ux/pages/home_page.dart';
import 'package:animation_course/7_route_aware/route_screen.dart';
// import 'package:animation_course/5_more_animations/ux/pages/animated_list_page.dart';
// import 'package:animation_course/5_more_animations/ux/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '0_widgets/widgets.dart';
import '5_more_animations/ux/pages/animated_list_page.dart';

void main() => runApp(ProviderScope(child: MyApp()));

// route observer 정의
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Boot camp',
      navigatorObservers: [routeObserver],
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          /// THESE ARE PROVIDED AS EXAMPLES.
          /// They define a MaterialPageRoute page transition animation.
          /// To customize the default MaterialPageRoute page transition
          /// animation for different platforms
          ///
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),

          // TargetPlatform.android: FadeTransitionBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      )),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
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
            const SizedBox(height: 12),
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
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AnimatedListPage(),
                  ));
                },
                child: const Text("5. More Animation")),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeRoutePage(),
                  ));
                },
                child: const Text("6. Routes")),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RouteScreen(),
                  ));
                },
                child: const Text("7. RouteAware Example")),
          ],
        ),
      ),
    );
  }
}
