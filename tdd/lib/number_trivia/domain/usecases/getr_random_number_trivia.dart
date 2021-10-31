import 'package:tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tdd/core/usecases/usecase.dart';
import 'package:tdd/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/number_trivia/infrastructure/repositories/number_trivia_repository.dart';

class GetrRandomNumberTrivia implements Usecase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  const GetrRandomNumberTrivia({required this.repository});

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
