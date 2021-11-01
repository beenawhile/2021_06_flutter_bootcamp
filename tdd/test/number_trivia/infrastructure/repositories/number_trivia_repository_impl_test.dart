import 'package:mockito/annotations.dart';
import 'package:tdd/core/network/network_info.dart';
import 'package:tdd/number_trivia/infrastructure/datasources/number_trivia_local_data_source.dart';
import 'package:tdd/number_trivia/infrastructure/datasources/number_trivia_remote_data_source.dart';

@GenerateMocks([
  NumberTriviaLocalDataSource,
  NumberTriviaRemoteDataSource,
  NetworkInfo,
])
void main() {}
