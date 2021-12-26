import 'dart:collection';

import 'package:flutter_design_patterns/design_patterns/interpreter/interpreter.dart';

class ExpressionHelpers {
  const ExpressionHelpers._();

  static final List<String> _operators = ["+", "-", "*"];

  static IExpression buildExpressionTree(String postfixExpression) {
    final expressionStack = ListQueue<IExpression>();

    for (final symbol in postfixExpression.split(" ")) {
      if (_isOperator(symbol)) {
        final rightExpression = expressionStack.removeLast();
        final leftExpression = expressionStack.removeLast();
        final nonTerminalExpression =
            _getNonTerminalExpression(symbol, leftExpression, rightExpression);

        expressionStack.addLast(nonTerminalExpression);
      } else {
        final numberExpression = Number(int.parse(symbol));
        expressionStack.addLast(numberExpression);
      }
    }
    return expressionStack.single;
  }

  static bool _isOperator(String symbol) {
    return _operators.contains(symbol);
  }

  static IExpression _getNonTerminalExpression(
    String symbol,
    IExpression leftExpression,
    IExpression rightExpression,
  ) {
    IExpression expression;

    switch (symbol) {
      case "+":
        expression = Add(leftExpression, rightExpression);
        break;
      case "-":
        expression = Subtraction(leftExpression, rightExpression);
        break;
      case "*":
        expression = Multiply(leftExpression, rightExpression);
        break;
      default:
        throw Exception("Expression is not defined");
    }

    return expression;
  }
}
