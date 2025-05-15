import 'package:flutter_movie_app/features/movie/domain/entity/movie.dart';
import 'package:flutter_movie_app/features/movie/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/features/movie/presentation/providers/movie_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieState {
  List<Movie> popular;
  List<Movie> nowPlaying;
  List<Movie> topRate;
  List<Movie> upcoming;
  List<Movie> searched;

  MovieState({
    required this.popular,
    required this.nowPlaying,
    required this.topRate,
    required this.upcoming,
    required this.searched,
  });
}

class MovieViewModel extends FamilyAsyncNotifier<MovieState, String> {
  //
  late final MovieRepository _movieRepository;

  @override
  Future<MovieState> build(String title) async {
    _movieRepository = ref.read(movieRepositoryProvider);
    return MovieState(
      popular: await _movieRepository.fetchPopularMovies(),
      nowPlaying: await _movieRepository.fetchNowPlayingMovies(),
      topRate: await _movieRepository.fetchTopRateMovies(),
      upcoming: await _movieRepository.fetchUpcomingMovies(),
      searched: title.trim().isNotEmpty
          ? await _movieRepository.fetchSearchedMovie(title.trim())
          : [],
    );
  }
}

final movieViewModelProvider =
    AsyncNotifierProvider.family<MovieViewModel, MovieState, String>(
        (MovieViewModel.new));
