import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([DataConnectionChecker])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(
    () {
      mockDataConnectionChecker = MockDataConnectionChecker();
      networkInfo = NetworkInfoImpl(
        connectionChecker: mockDataConnectionChecker,
      );
    },
  );

  group(
    "isConnected",
    () {
      test(
        "should forward the call to DataConnectionChecker.hasConnection",
        () async {
          // arrange
          final tHasConnectionFuture = Future.value(true);

          when(mockDataConnectionChecker.hasConnection)
              .thenAnswer((_) => tHasConnectionFuture);

          // act
          // NOTICE: We're NOT awaiting the result
          final result = networkInfo.isConnected;
          verify(mockDataConnectionChecker.hasConnection);
          // Utilizing Dart's default referential equality.
          // Only references to the same object are equal.

          expect(result, tHasConnectionFuture);
        },
      );
    },
  );
}
