import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:tdd/core/network/network_info.dart';
import 'package:tdd/core/util/input_converter.dart';
import 'package:tdd/number_trivia/application/number_trivia_state.dart';
import 'package:tdd/number_trivia/application/number_trivia_state_notifier.dart';
import 'package:tdd/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:tdd/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:tdd/number_trivia/infrastructure/datasources/number_trivia_local_data_source.dart';
import 'package:tdd/number_trivia/infrastructure/datasources/number_trivia_remote_data_source.dart';
import 'package:tdd/number_trivia/infrastructure/repositories/number_trivia_repository.dart';
import 'package:tdd/number_trivia/infrastructure/repositories/number_trivia_repository_impl.dart';

//! Features
//  Domain
//  - Usecase
final getConcreteNumberTriviaProvider = Provider<GetConcreteNumberTrivia>(
  (ref) => GetConcreteNumberTrivia(
    repository: ref.watch(numberTriviaRepositoryProvider),
  ),
);
final getRandomNumberProvider = Provider<GetRandomNumberTrivia>(
  (ref) => GetRandomNumberTrivia(
    repository: ref.watch(numberTriviaRepositoryProvider),
  ),
);

//  Infrastructure
//  - DataSources
final localDataSourceProvider = Provider<NumberTriviaLocalDataSource>(
  (ref) => NumberTriviaLocalDataSourceImpl(
    sharedPreferences: ref.watch(sharedPreferencesProvider),
  ),
);
final remoteDataSourceProvider = Provider<NumberTriviaRemoteDataSource>(
  (ref) => NumberTriviaRemoteDataSourceImpl(
    client: ref.watch(httpClientProvider),
  ),
);
//  - Repository
final numberTriviaRepositoryProvider =
    Provider<NumberTriviaRepository>((ref) => NumberTriviaRepositoryImpl(
          remoteDataSource: ref.watch(remoteDataSourceProvider),
          localDataSource: ref.watch(localDataSourceProvider),
          networkInfo: ref.watch(networkInfoProvider),
        ));

//  Application
final numberTriviaNotifierProvider =
    StateNotifierProvider<NumberTriviaStateNotifier, NumberTriviaState>(
  (ref) => NumberTriviaStateNotifier(
    getConcreteNumberTrivia: ref.watch(getConcreteNumberTriviaProvider),
    getRandomNumberTrivia: ref.watch(getRandomNumberProvider),
    inputConverter: ref.watch(inputConverterProvider),
  ),
);
//! Core
final inputConverterProvider = Provider<InputConverter>(
  (ref) => InputConverter(),
);

final networkInfoProvider = Provider<NetworkInfo>(
  (ref) => NetworkInfoImpl(
    connectionChecker: ref.watch(connectionCheckerProvider),
  ),
);

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

final httpClientProvider = Provider<http.Client>(
  (ref) => http.Client(),
);

final connectionCheckerProvider = Provider<DataConnectionChecker>(
  (ref) => DataConnectionChecker(),
);
