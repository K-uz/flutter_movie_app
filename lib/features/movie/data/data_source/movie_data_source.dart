import 'package:flutter_movie_app/features/movie/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/features/movie/data/dto/movie_dto.dart';

abstract interface class MovieDataSource {
  Future<List<MovieDto>> fetchPopularMovies();
  Future<List<MovieDto>> fetchUpcomingMovies();
  Future<List<MovieDto>> fetchTopRateMovies();
  Future<List<MovieDto>> fetchNowPlayingMovies();
  Future<MovieDetailDto?> fetchMovieDetail(int id);
  Future<List<MovieDto>> fetchSearchedMovie(String title);
}
