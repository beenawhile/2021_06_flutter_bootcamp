import 'package:animation_course/main.dart';
import 'package:flutter/material.dart';

class RouteAwareExample extends StatelessWidget {
  const RouteAwareExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Page / 1st Page"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RouteAwareWidget(),
                    ),
                  );
                },
                child: const Text("Push"))
          ],
        ),
      ),
    );
  }
}

class RouteAwareWidget extends StatefulWidget {
  const RouteAwareWidget({Key? key}) : super(key: key);

  @override
  _RouteAwareWidgetState createState() => _RouteAwareWidgetState();
}

// Implement RouteAware in a widget's state and subscribe it to the RouteObserver.
class _RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  Alignment align = Alignment.centerLeft;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) => afterFirstLayout());
  }

  /// Brings functionality to execute code after the first layout of a widget
  /// has been performed, in other words after the first frame has been
  /// displayed
  /// This could be used to trigger an implicit animation by updating some
  /// value and calling [setState].
  void afterFirstLayout() {
    print("afterFirstLayout");
    _updateAlign(Alignment.centerRight);
  }

  void _updateAlign(Alignment newAlign) {
    setState(() {
      align = newAlign;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    // Called when the current route has been pushed.
    print('didPush');
    super.didPush();

    // Calling setstate here will just set the initial state, it won't update any value.
    // Meaning the AnimatedAlign will not be triggered as there will be no change in values.
  }

  @override
  void didPopNext() {
    // Called when the top route has been popped off, and the current route
    // shows up.
    print('didPopNext');
    _updateAlign(Alignment.center);
    super.didPopNext();
  }

  @override
  void didPop() {
    // Called when the current route has been popped off.
    print('didPop');

    _updateAlign(Alignment.centerLeft);
    super.didPop();
  }

  @override
  void didPushNext() {
    // Called when a new route has been pushed, and the current route is no
    // longer visible.
    print('didPushNext');

    _updateAlign(Alignment.centerRight);
    super.didPushNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Route Aware Page / 2nd Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AnotherPage(),
                  ),
                );
              },
              child: const Text('Push again'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Pop'),
            ),
            AnimatedAlign(
              alignment: align,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('This is the third and final page'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Pop'),
            )
          ],
        ),
      ),
    );
  }
}
