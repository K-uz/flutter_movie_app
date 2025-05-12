import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// MockDio 클래스 정의
class MockDio extends Mock implements Dio {}

void main() {
  late MockDio dio;
  late MovieDataSourceImpl movieDataSourceImpl;

  // setUp: 테스트 환경 설정
  setUp(() {
    dio = MockDio(); // MockDio 객체 생성
    movieDataSourceImpl =
        MovieDataSourceImpl(dio: dio, apiKey: '1'); // MovieDataSourceImpl 객체 생성
  });

  test('mock_movie_data_source_test', () async {
    // dio.get 메서드 모킹
    when(() => dio.get(any(),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(
                path: '1',
                headers: {},
              ),
              data: {
                'results': [
                  {
                    'id': 0,
                    'title': 'title',
                    'overview': 'overview',
                    'poster_path': 'poster_path',
                    'vote_average': 0.0,
                    'release_date': 'release_date',
                  }
                ]
              },
              statusCode: 200,
            ));

    final result = await movieDataSourceImpl.fetchNowPlayingMovies();

    expect(result[0].title, 'title');
  });
}
