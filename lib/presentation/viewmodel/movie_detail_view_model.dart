import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/presentation/providers/movie_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailViewModel extends FamilyAsyncNotifier<MovieDetail?, int> {
  //
  late final MovieRepository _movieRepository;
  @override
  Future<MovieDetail?> build(int id) async {
    _movieRepository = ref.read(movieRepositoryProvider);

    return await _movieRepository.fetchMovieDetail(id);
  }
}

final movieDetailViewModelProvider =
    AsyncNotifierProvider.family<MovieDetailViewModel, MovieDetail?, int>(
  (MovieDetailViewModel.new),
);
