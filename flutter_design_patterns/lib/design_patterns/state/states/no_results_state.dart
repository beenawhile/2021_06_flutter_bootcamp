import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/state/states/loading_state.dart';

import '../state.dart';

class NoResultsState implements IState {
  @override
  Future<void> nextState(StateContext context) async {
    context.setState(LoadingState());
  }

  @override
  Widget render() {
    return const Text(
      "No Results",
      style: TextStyle(
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
    );
  }
}
