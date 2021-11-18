import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test_practice/article.dart';
import 'package:unit_test_practice/news_change_notifier.dart';
import 'package:unit_test_practice/news_service.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late NewsChangeNotifier sut;
  late MockNewsService mockNewsService;

  setUp(
    () {
      mockNewsService = MockNewsService();
      sut = NewsChangeNotifier(mockNewsService);
    },
  );

  test(
    "initial values are correct",
    () {
      expect(sut.articles, []);
      expect(sut.isLoading, false);
    },
  );

  group(
    "getArticles",
    () {
      final articlesFromService = [
        Article(title: "Test 1", content: "Test 1 content"),
        Article(title: "Test 2", content: "Test 2 content"),
        Article(title: "Test 3", content: "Test 3 content"),
      ];
      void arrangeNewsServiceReturns3Articles() {
        /// thenReturn: use it when a function doesn't return Future
        /// thenAnswer: use it when a function returns Future

        when(() => mockNewsService.getArticles()).thenAnswer(
          (_) async => articlesFromService,
        );
      }

      test(
        "gets Articles using the NewService",
        () async {
          // arrange mock
          arrangeNewsServiceReturns3Articles();
          // act call
          await sut.getArticles();
          // assert particular method is called
          verify(() => mockNewsService.getArticles()).called(1);
        },
      );

      test(
        """
        indicates loading of data,
        sets articles to the ones from the service,
        and indicates that data is not being loaded anymore
        """,
        () async {
          // arrange
          arrangeNewsServiceReturns3Articles();
          // act
          final future = sut.getArticles();
          expect(sut.isLoading, true);
          await future;
          expect(sut.isLoading, false);
          expect(sut.articles, articlesFromService);
          // assert
        },
      );
    },
  );
}
