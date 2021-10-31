import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:tdd/number_trivia/infrastructure/repositories/number_trivia_repository.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  GetConcreteNumberTrivia usecase;

  MockNumberTriviaRepository mockNumberTriviaRepository;

  mockNumberTriviaRepository = MockNumberTriviaRepository();
  usecase = GetConcreteNumberTrivia(
    repository: mockNumberTriviaRepository,
  );

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: "test", number: 1);
  test("should get trivia for number from the repository", () async {
    // arrange
    when(mockNumberTriviaRepository.getContreteNumberTrivia(any))
        .thenAnswer((_) async => const Right(tNumberTrivia));

    // act
    final result = await usecase(const Params(number: tNumber));

    // assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getContreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
