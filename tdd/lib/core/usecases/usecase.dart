import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tdd/core/error/failures.dart';

part 'usecase.freezed.dart';

// Parameters and reture Type

// Parameters have to be put into a container object so that they can be
// included in this abstract base class method definition.
abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// This will be used by the code calling the use case whenever the use case
// doesn't accept any parameters.
@freezed
class NoParams with _$NoParams {
  const NoParams._();
  const factory NoParams() = _NoParams;
}
