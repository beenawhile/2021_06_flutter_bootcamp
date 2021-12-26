import 'package:flutter_design_patterns/design_patterns/interpreter/interpreter.dart';

class Subtraction implements IExpression {
  final IExpression leftExpression;
  final IExpression rightExpression;

  const Subtraction(this.leftExpression, this.rightExpression);

  @override
  int interpret(ExpressionContext context) {
    final left = leftExpression.interpret(context);
    final right = rightExpression.interpret(context);
    final result = left - right;
    context.addSolutionSteps("-", left, right, result);
    return result;
  }
}
