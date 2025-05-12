import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchTopRatedMoviesUsecase {
  FetchTopRatedMoviesUsecase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  final MovieRepository _movieRepository;

  Future<List<Movie>> execute() async {
    return _movieRepository.fetchTopRateMovies();
  }
}
