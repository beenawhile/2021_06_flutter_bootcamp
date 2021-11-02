import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/core/error/exceptions.dart';
import 'package:tdd/core/error/failures.dart';
import 'package:tdd/core/network/network_info.dart';
import 'package:tdd/number_trivia/infrastructure/datasources/number_trivia_local_data_source.dart';
import 'package:tdd/number_trivia/infrastructure/datasources/number_trivia_remote_data_source.dart';
import 'package:tdd/number_trivia/infrastructure/models/number_trivia_model.dart';
import 'package:tdd/number_trivia/infrastructure/repositories/number_trivia_repository_impl.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

@GenerateMocks([
  NumberTriviaLocalDataSource,
  NumberTriviaRemoteDataSource,
  NetworkInfo,
])
void main() {
  late NumberTriviaRepositoryImpl repository;
  late MockNumberTriviaRemoteDataSource mockRemoteDataSource;
  late MockNumberTriviaLocalDataSource mockLocalDataSource;
  late MockNetworkInfo networkInfo;

  setUp(
    () {
      mockRemoteDataSource = MockNumberTriviaRemoteDataSource();
      mockLocalDataSource = MockNumberTriviaLocalDataSource();
      networkInfo = MockNetworkInfo();
      repository = NumberTriviaRepositoryImpl(
        localDataSource: mockLocalDataSource,
        remoteDataSource: mockRemoteDataSource,
        networkInfo: networkInfo,
      );
    },
  );

  group(
    "getConcreteNumberTrivia",
    () {
      final tNumber = 1;
      final tNumberTriviaModel = NumberTriviaModel(
        text: "test",
        number: tNumber,
      );
      final tNumberTrivia = tNumberTriviaModel.toDomain();

      group(
        "device is online",
        () {
          setUp(
            () {
              when(networkInfo.isConnected).thenAnswer((_) async => true);
            },
          );

          test(
            "should return remote data when the call to remote data source is successful",
            () async {
              // arrange
              when(mockRemoteDataSource.getConcreteNumberTrivia(any))
                  .thenAnswer(
                (_) async => tNumberTriviaModel,
              );
              // act
              final result = await repository.getContreteNumberTrivia(tNumber);
              // assert
              verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
              expect(result, equals(Right(tNumberTrivia)));
            },
          );

          test(
            "should cache the data locally when the call to remote data source is successful",
            () async {
              // arrange
              when(mockRemoteDataSource.getConcreteNumberTrivia(any))
                  .thenAnswer(
                (_) async => tNumberTriviaModel,
              );
              // act
              await repository.getContreteNumberTrivia(tNumber);
              // assert
              verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
              verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
            },
          );

          test(
            "should return server failure when the call to remote data source is unsuccessful",
            () async {
              // arrange
              when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenThrow(
                ServerException(),
              );
              // act
              final result = await repository.getContreteNumberTrivia(tNumber);
              // assert
              verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));

              /// make sure nothing is cached
              verifyZeroInteractions(mockLocalDataSource);
              expect(result, equals(const Left(ServerFailure())));
            },
          );
        },
      );

      group(
        "device is offline",
        () {
          setUp(
            () {
              when(networkInfo.isConnected).thenAnswer((_) async => false);
            },
          );
        },
      );
    },
  );
}
