import 'package:flutter/material.dart';

class GrpcTabView extends StatelessWidget {
  const GrpcTabView({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints(maxWidth: 300),
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
