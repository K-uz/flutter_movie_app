import 'package:flutter_movie_app/features/movie/domain/entity/movie.dart';
import 'package:flutter_movie_app/features/movie/domain/repository/movie_repository.dart';

class FetchUpcomingMoviesUsecase {
  FetchUpcomingMoviesUsecase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;
  final MovieRepository _movieRepository;
  Future<List<Movie>> execute() async {
    return _movieRepository.fetchUpcomingMovies();
  }
}
