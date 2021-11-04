import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/number_trivia/infrastructure/models/number_trivia_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: "Test Text");

  test("should be a subclass of NumberTrivia entity", () async {
    expect(tNumberTriviaModel.toDomain(), isA<NumberTrivia>());
  });

  group("fromJson", () {
    test(
      "should return a valid model when the JSON number is an integer",
      () async {
        final jsonMap = json.decode(fixture("trivia_double.json"));

        final result = NumberTriviaModel.fromJson(jsonMap);

        expect(result, tNumberTriviaModel);
      },
    );

    test(
      "should return a valid model when the JSON number is an integer",
      () async {
        final jsonMap = json.decode(fixture("trivia.json"));

        final result = NumberTriviaModel.fromJson(jsonMap);

        expect(result, tNumberTriviaModel);
      },
    );
  });

  group("toJson", () {
    test(
      "should return a JSON map containing the proper data",
      () async {
        final result = tNumberTriviaModel.toJson();

        final expectedJsonMap = {
          "text": "Test Text",
          "number": 1,
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
