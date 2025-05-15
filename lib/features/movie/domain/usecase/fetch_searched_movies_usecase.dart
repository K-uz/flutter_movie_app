import 'package:flutter_movie_app/features/movie/domain/entity/movie.dart';
import 'package:flutter_movie_app/features/movie/domain/repository/movie_repository.dart';

class FetchSearchedMoviesUsecase {
  FetchSearchedMoviesUsecase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;
  final MovieRepository _movieRepository;

  Future<List<Movie>> excute(String title) async {
    return _movieRepository.fetchSearchedMovie(title);
  }
}
