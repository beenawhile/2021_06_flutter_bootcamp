import 'package:flutter/material.dart';

class PerspectiveDemo extends StatefulWidget {
  const PerspectiveDemo({Key? key}) : super(key: key);

  @override
  _PerspectiveDemoState createState() => _PerspectiveDemoState();
}

class _PerspectiveDemoState extends State<PerspectiveDemo> {
  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform"),
      ),
      body: Center(
        child: Transform(
          transform: Matrix4(
            1, 0, 0, 0, // for formatting
            0, 1, 0, 0,
            0, 0, 1, 0.002,
            0, 0, 0, 1,
          )
            ..rotateX(x)
            ..rotateY(y)
            ..rotateZ(z),
          // alignment: FractionalOffset.center,
          // alignment: FractionalOffset.centerLeft,
          alignment: FractionalOffset.topLeft,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                y = y - details.delta.dx / 100;
                x = x + details.delta.dy / 100;
              });
            },
            child: Container(
              color: Colors.black,
              height: 200.0,
              width: 200.0,
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Hello, world!'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
