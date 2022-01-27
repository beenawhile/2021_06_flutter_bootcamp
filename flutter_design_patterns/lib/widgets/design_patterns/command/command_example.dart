import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/layout_constants.dart';
import 'package:flutter_design_patterns/design_patterns/command/commands/index.dart';
import 'package:flutter_design_patterns/design_patterns/command/index.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/command/command_history_column.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/command/shape_container.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class CommandExample extends StatefulWidget {
  const CommandExample({Key? key}) : super(key: key);

  @override
  State<CommandExample> createState() => _CommandExampleState();
}

class _CommandExampleState extends State<CommandExample> {
  final _commandHistory = CommandHistory();
  final _shape = Shape.initial();

  void _changeColor() {
    final command = ChangeColorCommand(shape: _shape);
    _executeCommand(command);
  }

  void _changeWidth() {
    final command = ChangeWidthCommand(shape: _shape);
    _executeCommand(command);
  }

  void _changeHeight() {
    final command = ChangeHeightCommand(shape: _shape);
    _executeCommand(command);
  }

  void _executeCommand(ICommand command) {
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(() {
      _commandHistory.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          children: [
            ShapeContainer(shape: _shape),
            const SizedBox(height: LayoutConstants.spaceM),
            PlatformButton(
              text: "Change Color",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeColor,
            ),
            PlatformButton(
              text: "Change Height",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeHeight,
            ),
            PlatformButton(
              text: "Change Width",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeWidth,
            ),
            const Divider(),
            PlatformButton(
              text: "Undo",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _undo,
            ),
            const SizedBox(height: LayoutConstants.spaceM),
            Row(
              children: [
                CommandHistoryColumn(
                    commandList: _commandHistory.commandHistory),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
