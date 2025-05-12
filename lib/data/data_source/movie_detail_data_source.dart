import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';

abstract interface class MovieDetailDataSource {
  Future<MovieDetailDto?> fetchMovieDetail(int id);
}
