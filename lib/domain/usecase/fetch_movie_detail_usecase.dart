import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_detail_repository.dart';

class FetchMovieDetailUsecase {
  FetchMovieDetailUsecase(
      {required MovieDetailRepository movieDetailRepository})
      : _movieDetailRepository = movieDetailRepository;

  final MovieDetailRepository _movieDetailRepository;

  Future<MovieDetail?> execute(int id) async {
    return _movieDetailRepository.fetchMovieDetail(id);
  }
}
