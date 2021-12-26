import 'package:flutter_design_patterns/design_patterns/interpreter/interpreter.dart';

class Number implements IExpression {
  final int number;

  const Number(this.number);

  @override
  int interpret(ExpressionContext context) {
    return number;
  }
}
