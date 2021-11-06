import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tdd/core/util/input_converter.dart';
import 'package:tdd/number_trivia/application/number_trivia_state.dart';
import 'package:tdd/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:tdd/number_trivia/domain/usecases/get_random_number_trivia.dart';

class NumberTriviaStateNotifier extends StateNotifier<NumberTriviaState> {
  NumberTriviaStateNotifier({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(const NumberTriviaState.empty());

  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;
}
