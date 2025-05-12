import 'package:flutter_movie_app/data/repository/movie_detail_repository_impl.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailViewModel extends FamilyAsyncNotifier<MovieDetail?, int> {
  final movieDetailRepository = MovieDetailRepositoryImpl();

  @override
  Future<MovieDetail?> build(int id) async {
    return await movieDetailRepository.fetchMovieDetail(id);
  }
}

final movieDetailViewModelProvider =
    AsyncNotifierProvider.family<MovieDetailViewModel, MovieDetail?, int>(
  (MovieDetailViewModel.new),
);
