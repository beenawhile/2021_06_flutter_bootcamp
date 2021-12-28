import 'package:flutter_design_patterns/design_patterns/memento/command_design_pattern/shape.dart';
import 'package:flutter_design_patterns/design_patterns/memento/memento/i_memento.dart';

class Memento extends IMemento {
  late final Shape _state;

  Memento(Shape shape) {
    _state = Shape.copy(shape);
  }

  @override
  Shape getState() {
    return _state;
  }
}
