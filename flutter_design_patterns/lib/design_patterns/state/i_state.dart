import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/state/state.dart';

abstract class IState {
  Future<void> nextState(StateContext context);
  Widget render();
}
