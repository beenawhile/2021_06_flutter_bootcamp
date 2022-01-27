import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/memento/command_design_pattern/i_command.dart';
import 'package:flutter_design_patterns/design_patterns/memento/memento/i_memento.dart';
import 'package:flutter_design_patterns/design_patterns/memento/originator.dart';

class RandomizePropertiesCommand implements ICommand {
  final Originator originator;
  late final IMemento _backup;

  RandomizePropertiesCommand(this.originator) {
    _backup = originator.createMemento();
  }

  @override
  void execute() {
    final shape = originator.state;

    shape.color = Color.fromRGBO(
        random.integer(255), random.integer(255), random.integer(255), 1);

    shape.width = random.integer(150, min: 50).toDouble();
    shape.height = random.integer(150, min: 50).toDouble();
  }

  @override
  void undo() {
    originator.restore(_backup);
  }
}
