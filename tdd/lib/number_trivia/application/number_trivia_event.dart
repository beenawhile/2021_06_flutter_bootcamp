import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_trivia_event.freezed.dart';

@freezed
class NumberTriviaEvent with _$NumberTriviaEvent {
  const NumberTriviaEvent._();
  const factory NumberTriviaEvent.getTriviaForConcreteNumber(String number) =
      GetTriviaForConcreteNumber;
  const factory NumberTriviaEvent.getTriviaForRandomNumber() =
      GetTriviaForRandomNumber;
}
