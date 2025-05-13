import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';

abstract interface class MovieRepository {
  //
  Future<List<Movie>> fetchPopularMovies();
  Future<List<Movie>> fetchUpcomingMovies();
  Future<List<Movie>> fetchTopRateMovies();
  Future<List<Movie>> fetchNowPlayingMovies();
  Future<MovieDetail?> fetchMovieDetail(int id);
}
