import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';
import 'package:flutter_design_patterns/design_patterns/memento/command_design_pattern/command_history.dart';
import 'package:flutter_design_patterns/design_patterns/memento/command_design_pattern/commands/randomize_properties_command.dart';
import 'package:flutter_design_patterns/design_patterns/memento/command_design_pattern/i_command.dart';
import 'package:flutter_design_patterns/design_patterns/memento/originator.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/memento/shape_container.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class MementoExample extends StatefulWidget {
  const MementoExample({Key? key}) : super(key: key);

  @override
  _MementoExampleState createState() => _MementoExampleState();
}

class _MementoExampleState extends State<MementoExample> {
  final CommandHistory _commandHistory = CommandHistory();
  final Originator _originator = Originator();

  void _randomiseProperties() {
    final command = RandomizePropertiesCommand(_originator);
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
        padding:
            const EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
        child: Column(
          children: [
            ShapeContainer(
              shape: _originator.state,
            ),
            const SizedBox(height: LayoutConstants.spaceM),
            PlatformButton(
              text: "Randomise properties",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _randomiseProperties,
            ),
            const Divider(),
            PlatformButton(
              text: "Undo",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _commandHistory.isEmpty ? null : _undo,
            ),
            const SizedBox(height: LayoutConstants.spaceM),
          ],
        ),
      ),
    );
  }
}
