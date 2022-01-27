import 'package:faker/faker.dart';
import 'package:flutter_design_patterns/design_patterns/command/index.dart';

class ChangeHeightCommand implements ICommand {
  final Shape shape;
  late double previousHeight;
  ChangeHeightCommand({
    required this.shape,
  }) {
    previousHeight = shape.height;
  }

  @override
  String getTitle() {
    return "Change Height";
  }

  @override
  void execute() {
    shape.height = random.integer(150, min: 50).toDouble();
  }

  @override
  void undo() {
    shape.height = previousHeight;
  }
}
