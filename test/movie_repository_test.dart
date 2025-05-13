import 'package:flutter_movie_app/features/movie/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/features/movie/data/dto/movie_dto.dart';
import 'package:flutter_movie_app/features/movie/data/repository/movie_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieDataSource extends Mock implements MovieDataSource {}

void main() {
  late final MockMovieDataSource mockMovieDataSource;
  late final MovieRepositoryImpl movieRepositoryImpl;

  setUp(() {
    mockMovieDataSource = MockMovieDataSource();
    movieRepositoryImpl =
        MovieRepositoryImpl(movieDataSource: mockMovieDataSource);
  });
  test('movie_repository_test', () async {
    when(() => mockMovieDataSource.fetchNowPlayingMovies())
        .thenAnswer((_) async {
      return [
        MovieDto(
          adult: false,
          backdropPath: 'backdropPath',
          genreIds: [],
          id: 0,
          originalLanguage: 'originalLanguage',
          originalTitle: 'originalTitle',
          overview: 'overview',
          popularity: 0.0,
          posterPath: 'posterPath',
          releaseDate: DateTime(2000, 1, 1),
          title: 'title',
          video: false,
          voteAverage: 0.0,
          voteCount: 0,
        )
      ];
    });
    final result = await movieRepositoryImpl.fetchNowPlayingMovies();
    expect(result.first.id, 0);
  });
}
