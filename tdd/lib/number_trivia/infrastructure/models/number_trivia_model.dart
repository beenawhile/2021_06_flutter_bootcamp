import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tdd/number_trivia/domain/entities/number_trivia.dart';

part 'number_trivia_model.freezed.dart';
part 'number_trivia_model.g.dart';

@freezed
class NumberTriviaModel with _$NumberTriviaModel {
  const NumberTriviaModel._();
  const factory NumberTriviaModel({
    required String text,
    required num number,
  }) = _NumberTriviaModel;

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      _$NumberTriviaModelFromJson(json);

  NumberTrivia toDomain() {
    return NumberTrivia(
      text: text,
      number: number.toInt(),
    );
  }
}
