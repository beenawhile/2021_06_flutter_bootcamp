import 'package:animation_course/6_routes/ux/styles/styles.dart';
import 'package:flutter/material.dart';

class LearnMoreButton extends StatefulWidget {
  const LearnMoreButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  _LearnMoreButtonState createState() => _LearnMoreButtonState();
}

class _LearnMoreButtonState extends State<LearnMoreButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  static const buttonWidth = 300.0;
  static const buttonHeight = 200.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: Center(
                child: Text(
                  "Learn more",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: antiFlashColor),
                ),
              ),
            );
          },
        ));
  }
}
