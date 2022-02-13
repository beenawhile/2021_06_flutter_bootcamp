import 'package:animation_course/7_route_aware/route_aware_example.dart';
import 'package:flutter/material.dart';

import 'transform_example.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route Pages"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RouteAwareExample(),
                  ),
                ),
                child: const Text("RouteAware Example"),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PerspectiveDemo())),
                child: const Text("Transform example"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
