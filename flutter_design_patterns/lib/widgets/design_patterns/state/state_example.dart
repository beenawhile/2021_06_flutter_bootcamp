import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/layout_constants.dart';
import 'package:flutter_design_patterns/design_patterns/state/state.dart';
import 'package:flutter_design_patterns/design_patterns/state/states/no_results_state.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class StateExample extends StatefulWidget {
  const StateExample({Key? key}) : super(key: key);

  @override
  _StateExampleState createState() => _StateExampleState();
}

class _StateExampleState extends State<StateExample> {
  final _stateContext = StateContext();

  Future<void> _changeState() async {
    await _stateContext.nextState();
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
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
            PlatformButton(
              text: "Load names",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeState,
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            StreamBuilder(
              initialData: NoResultsState(),
              stream: _stateContext.outState,
              builder: (_, AsyncSnapshot<IState> snapshot) =>
                  snapshot.data!.render(),
            ),
          ],
        ),
      ),
    );
  }
}
