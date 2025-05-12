import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_detail_repository.dart';
import 'package:flutter_movie_app/presentation/providers/movie_detail_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailViewModel extends FamilyAsyncNotifier<MovieDetail?, int> {
  //
  late final MovieDetailRepository _movieDetailRepository;
  @override
  Future<MovieDetail?> build(int id) async {
    _movieDetailRepository = ref.read(movieDetailRepositoryProvider);

    return await _movieDetailRepository.fetchMovieDetail(id);
  }
}

final movieDetailViewModelProvider =
    AsyncNotifierProvider.family<MovieDetailViewModel, MovieDetail?, int>(
  (MovieDetailViewModel.new),
);
