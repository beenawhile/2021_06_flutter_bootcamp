import 'package:animation_course/6_routes/ux/styles/styles.dart';
import 'package:flutter/material.dart';

class BinaryBackground extends StatelessWidget {
  const BinaryBackground({
    Key? key,
    required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: greyBlueColor),
        AnimatedContainer(duration: const Duration(milliseconds: 600)),
        Positioned.fill(
            child: Image.asset(
          "assets/images/binary_background.png",
          color: antiFlashColor.withOpacity(.2),
          alignment: Alignment.lerp(
              const Alignment(-0.9, 0), const Alignment(0.9, 0), value)!,
          fit: BoxFit.cover,
        ))
      ],
    );
  }
}
