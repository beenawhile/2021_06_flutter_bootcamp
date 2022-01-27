import 'dart:collection';

import 'package:flutter_design_patterns/design_patterns/command/index.dart';

class CommandHistory {
  final ListQueue<ICommand> _commandList = ListQueue<ICommand>();

  bool get isEmpty => _commandList.isEmpty;
  List<String> get commandHistory =>
      _commandList.map((ICommand command) => command.getTitle()).toList();

  void add(ICommand command) {
    _commandList.add(command);
  }

  void undo() {
    if (_commandList.isNotEmpty) {
      final command = _commandList.removeLast();
      command.undo();
    }
  }
}
