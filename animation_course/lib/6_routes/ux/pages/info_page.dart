import 'package:animation_course/6_routes/models/content_model.dart';
import 'package:animation_course/6_routes/ux/styles/styles.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({
    Key? key,
    required this.content,
  }) : super(key: key);

  final ContentModel content;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static final _positionTween =
      Tween<Offset>(begin: const Offset(0, 500), end: const Offset(0, 0))
          .chain(CurveTween(curve: Curves.ease));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: [
          Container(color: greyBlueColor),
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SlideTransition(
                  position: _controller.drive(_positionTween),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: 0.75,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: gummentalColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black87,
                                  blurRadius: 10,
                                  offset: Offset(7, 7),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: FractionallySizedBox(
                            heightFactor: 0.7,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  widget.content.description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(color: antiFlashColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
          Align(
            alignment: const Alignment(0, -0.8),
            child: FractionallySizedBox(
              heightFactor: 0.3,
              child: Hero(
                tag: widget.content.titleTag,
                child: Image.asset(widget.content.logoLocation),
              ),
            ),
          )
        ],
      ),
    );
  }
}
