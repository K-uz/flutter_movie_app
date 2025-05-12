import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late final Dio dio;
  late final MovieDataSourceImpl movieDataSourceImpl;

  setUp(() {
    dio = Dio();
    movieDataSourceImpl = MovieDataSourceImpl(dio: dio);
  });
  test('mock_movie_data_source_test', () {
    //
  });
}
