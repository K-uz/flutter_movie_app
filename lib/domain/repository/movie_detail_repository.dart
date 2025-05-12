import 'package:flutter_movie_app/domain/entity/movie_detail.dart';

abstract interface class MovieDetailRepository {
  Future<MovieDetail?> fetchMovieDetail(int id);
}
