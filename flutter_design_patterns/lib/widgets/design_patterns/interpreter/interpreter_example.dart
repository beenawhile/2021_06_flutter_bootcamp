import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/layout_constants.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/interpreter/expression_section.dart';

class InterpreterExample extends StatefulWidget {
  const InterpreterExample({Key? key}) : super(key: key);

  @override
  State<InterpreterExample> createState() => _InterpreterExampleState();
}

class _InterpreterExampleState extends State<InterpreterExample> {
  final List<String> _postfixExpressions = [
    '20 3 5 * - 2 3 * +',
    '1 1 1 1 1 + + + * 2 -',
    '123 12 1 - - 12 9 * -',
    '9 8 7 6 5 4 3 2 1 + - + - + - + -'
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var postfixExpression in _postfixExpressions)
              ExpressionSection(
                postfixExpression: postfixExpression,
              )
          ],
        ),
      ),
    );
  }
}
