import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/state/apis/fake_api.dart';
import 'package:flutter_design_patterns/design_patterns/state/states/error_state.dart';
import 'package:flutter_design_patterns/design_patterns/state/states/loaded_state.dart';
import 'package:flutter_design_patterns/design_patterns/state/states/no_results_state.dart';

import '../state.dart';

class LoadingState implements IState {
  final FakeApi _api = FakeApi();

  @override
  Future<void> nextState(StateContext context) async {
    try {
      final resultList = await _api.getNames();

      if (resultList.isEmpty) {
        context.setState(NoResultsState());
      } else {
        context.setState(LoadedState(names: resultList));
      }
    } on Exception {
      context.setState(ErrorState());
    }
  }

  @override
  Widget render() {
    return const CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black,
      ),
    );
  }
}
