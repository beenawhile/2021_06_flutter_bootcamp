import 'package:tdd/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tdd/number_trivia/infrastructure/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  @override
  Future<Either<Failure, NumberTrivia>> getContreteNumberTrivia(num number) {
    // TODO: implement getContreteNumberTrivia
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
}
