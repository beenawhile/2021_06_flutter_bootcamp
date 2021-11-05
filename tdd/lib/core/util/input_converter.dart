import 'package:dartz/dartz.dart';
import 'package:tdd/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw const FormatException();
      return right(integer);
    } on FormatException {
      return left(const InvalidInputFailure());
    }
  }
}
