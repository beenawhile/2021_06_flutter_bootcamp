import 'example_state_base.dart';

class ExampleStateByDefinition extends ExampleStateBase {
  static ExampleStateByDefinition? _instance;

  ExampleStateByDefinition._internal() {
    initialText = "A new 'ExampleStateByDefinition' instance has been created.";
    stateText = initialText;
    print(stateText);
  }

  static ExampleStateByDefinition getState() {
    return _instance ??= ExampleStateByDefinition._internal();
  }
}
