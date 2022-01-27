import 'package:faker/faker.dart';
import 'package:flutter_design_patterns/design_patterns/command/index.dart';

class ChangeWidthCommand implements ICommand {
  final Shape shape;
  late double previousWidth;

  ChangeWidthCommand({
    required this.shape,
  }) {
    previousWidth = shape.width;
  }

  @override
  String getTitle() {
    return "Change Width";
  }

  @override
  void execute() {
    shape.width = random.integer(150, min: 50).toDouble();
  }

  @override
  void undo() {
    shape.width = previousWidth;
  }
}
