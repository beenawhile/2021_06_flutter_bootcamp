import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tdd/core/error/failures.dart';
import 'package:tdd/core/usecases/usecase.dart';
import 'package:tdd/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/number_trivia/infrastructure/repositories/number_trivia_repository.dart';

part 'get_concrete_number_trivia.freezed.dart';

class GetConcreteNumberTrivia implements Usecase<NumberTrivia, Params> {
  const GetConcreteNumberTrivia({required this.repository});
  final NumberTriviaRepository repository;

  // callable method!
  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getContreteNumberTrivia(params.number);
  }
}

@freezed
class Params with _$Params {
  const Params._();
  const factory Params({
    required num number,
  }) = _Params;
}
