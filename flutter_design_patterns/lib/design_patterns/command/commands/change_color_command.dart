import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/command/index.dart';

class ChangeColorCommand implements ICommand {
  final Shape shape;
  late Color previousColor;

  ChangeColorCommand({
    required this.shape,
  }) {
    previousColor = shape.color;
  }

  @override
  String getTitle() {
    return "Change Color";
  }

  @override
  void execute() {
    shape.color = Color.fromRGBO(
        random.integer(255), random.integer(255), random.integer(255), 1);
  }

  @override
  void undo() {
    shape.color = previousColor;
  }
}
