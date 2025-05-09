import 'package:flutter_movie_app/data/repository/movie_detail_repository.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailViewModel extends FamilyAsyncNotifier<MovieDetail?, int> {
  final movieDetailRepository = MovieDetailRepository();

  @override
  Future<MovieDetail?> build(int arg) async {
    return await movieDetailRepository.getMovieDetail(arg);
  }
}

final movieDetailViewModelProvider =
    AsyncNotifierProvider.family<MovieDetailViewModel, MovieDetail?, int>(
  (MovieDetailViewModel.new),
);
