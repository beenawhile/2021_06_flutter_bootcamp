import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';
import 'package:flutter_design_patterns/design_patterns/interpreter/expression_context.dart';
import 'package:flutter_design_patterns/design_patterns/interpreter/expression_helpers.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class ExpressionSection extends StatefulWidget {
  const ExpressionSection({
    Key? key,
    required this.postfixExpression,
  }) : super(key: key);

  final String postfixExpression;

  @override
  _ExpressionSectionState createState() => _ExpressionSectionState();
}

class _ExpressionSectionState extends State<ExpressionSection> {
  final _expressionContext = ExpressionContext();
  final _solutionSteps = <String>[];

  void _solvePrefixExpression() {
    final solutionSteps = <String>[];
    final expression =
        ExpressionHelpers.buildExpressionTree(widget.postfixExpression);
    final result = expression.interpret(_expressionContext);

    solutionSteps
      ..addAll(_expressionContext.getSolutionSteps())
      ..add("Result : $result");

    setState(() {
      _solutionSteps.addAll(solutionSteps);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.postfixExpression,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: LayoutConstants.spaceM),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 250),
          firstChild: PlatformButton(
            materialColor: Colors.black,
            materialTextColor: Colors.white,
            onPressed: _solvePrefixExpression,
            text: 'Solve',
          ),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (var solutionStep in _solutionSteps)
                Text(
                  solutionStep,
                  style: Theme.of(context).textTheme.subtitle2,
                )
            ],
          ),
          crossFadeState: _solutionSteps.isEmpty
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
        const SizedBox(height: LayoutConstants.spaceXL),
      ],
    );
  }
}
