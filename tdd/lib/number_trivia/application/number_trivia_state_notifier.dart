import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tdd/core/error/failures.dart';
import 'package:tdd/core/usecases/usecase.dart';
import 'package:tdd/core/util/input_converter.dart';
import 'package:tdd/number_trivia/application/number_trivia_event.dart';
import 'package:tdd/number_trivia/application/number_trivia_state.dart';
import 'package:tdd/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:tdd/number_trivia/domain/usecases/get_random_number_trivia.dart';

const serverFailureMessage = 'Server Failure';
const cacheFailureMessage = 'Cache Failure';
const invalidInputFailureMessage =
    'Invalid Input - The number must be a positive integer or zero';

class NumberTriviaStateNotifier extends StateNotifier<NumberTriviaState> {
  NumberTriviaStateNotifier({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(const NumberTriviaState.empty());

  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  Future<void> mapEventToState(NumberTriviaEvent event) async {
    event.map(
      getTriviaForConcreteNumber: (value) {
        final inputOrEither =
            inputConverter.stringToUnsignedInteger(value.numberString);
        inputOrEither.fold(
          (failure) => state = const NumberTriviaState.error(
              message: invalidInputFailureMessage),
          (number) async {
            state = const NumberTriviaState.loading();
            final failureOrTrivia =
                await getConcreteNumberTrivia(Params(number: number));

            state = _eitherLoadedOrError(failureOrTrivia);
          },
        );
      },
      getTriviaForRandomNumber: (number) async {
        state = const NumberTriviaState.loading();
        final failureOrTrivia = await getRandomNumberTrivia(const NoParams());
        state = _eitherLoadedOrError(failureOrTrivia);
      },
    );
  }

  NumberTriviaState _eitherLoadedOrError(
    Either<Failure, NumberTrivia> failureOrTrivia,
  ) {
    return failureOrTrivia.fold(
      (failure) =>
          NumberTriviaState.error(message: _mapFailureToMessage(failure)),
      (trivia) => NumberTriviaState.loaded(trivia: trivia),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.map(
      serverFailure: (_) => serverFailureMessage,
      cacheFailure: (_) => cacheFailureMessage,
      invalidInputFailure: (_) => invalidInputFailureMessage,
    );
  }
}
