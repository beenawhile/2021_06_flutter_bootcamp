import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd/core/util/input_converter.dart';
import 'package:tdd/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:tdd/number_trivia/domain/usecases/get_random_number_trivia.dart';

import 'number_trivia_state_notifier_test.mocks.dart';

@GenerateMocks([
  GetConcreteNumberTrivia,
  GetRandomNumberTrivia,
  InputConverter,
])
void main() {
  late MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  late MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  late MockInputConverter mockInputConverter;

  setUp(
    () {
      mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
      mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
      mockInputConverter = MockInputConverter();
    },
  );

  test(
    "initial state should be empty",
    () async {},
  );

  group(
    "GetTriviaForConcreteNumber",
    () {
      const tNumberString = "1";
      const tNumberParse = 1;
      const tNumberTrivia = NumberTrivia(
        text: "test trivia",
        number: 1,
      );

      void setUpMockInputConverterSuccess() =>
          when(mockInputConverter.stringToUnsignedInteger(any)).thenReturn(
            const Right(tNumberParse),
          );

      test(
        "should call the InputConverter to validate and convert the string to an unsigned integer",
        () async {
          // arrange
          // final sharedPreferences = await SharedPreferences.getInstance();
          // final container = ProviderContainer(overrides: [
          //   sharedPreferenceProvider.overrideWithValue(sharedPreferences),
          //   inputConverterProvider.overrideWithValue(mockInputConverter),
          // ]);
          // addTearDown(container.dispose);
          // setUpMockInputConverterSuccess();

          // // act
          // await untilCalled(mockInputConverter.stringToUnsignedInteger(any));

          // // assert
          // verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
        },
      );
    },
  );
}
