import 'package:flutter_movie_app/domain/entity/movie.dart';

abstract interface class MovieRepository {
  //
  Future<List<Movie>> fetchPopularMovies();
  Future<List<Movie>> fetchUpcomingMovies();
  Future<List<Movie>> fetchTopRateMovies();
  Future<List<Movie>> fetchNowPlayingMovies();
}
