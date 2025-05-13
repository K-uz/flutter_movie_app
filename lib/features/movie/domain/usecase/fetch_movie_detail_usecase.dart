import 'package:flutter_movie_app/features/movie/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/features/movie/domain/repository/movie_repository.dart';

class FetchMovieDetailUsecase {
  FetchMovieDetailUsecase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  final MovieRepository _movieRepository;

  Future<MovieDetail?> execute(int id) async {
    return _movieRepository.fetchMovieDetail(id);
  }
}
