import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late final MockMovieRepository mockMovieRepository;
  late final FetchNowPlayingMoviesUsecase fetchNowPlayingMoviesUsecase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    fetchNowPlayingMoviesUsecase =
        FetchNowPlayingMoviesUsecase(movieRepository: mockMovieRepository);
  });
  test('movie_usecase_test', () async {
    when(() => mockMovieRepository.fetchNowPlayingMovies())
        .thenAnswer((_) async {
      return [
        Movie(
          id: 0,
          title: 'title',
          posterPath: 'posterPath',
        )
      ];
    });
    final result = await fetchNowPlayingMoviesUsecase.execute();
    expect(result.first.id, 0);
  });
}
