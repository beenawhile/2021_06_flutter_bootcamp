import 'package:flutter_design_patterns/design_patterns/interpreter/interpreter.dart';

abstract class IExpression {
  int interpret(ExpressionContext context);
}
