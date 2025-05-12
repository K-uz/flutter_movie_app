import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/presentation/providers/movie_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieState {
  List<Movie> popular;
  List<Movie> nowPlaying;
  List<Movie> topRate;
  List<Movie> upcoming;

  MovieState({
    required this.popular,
    required this.nowPlaying,
    required this.topRate,
    required this.upcoming,
  });
}

class MovieViewModel extends AsyncNotifier<MovieState> {
  //
  late final MovieRepository _movieRepository;

  @override
  Future<MovieState> build() async {
    _movieRepository = ref.read(movieRepositoryProvider);
    return MovieState(
      popular: await _movieRepository.fetchPopularMovies(),
      nowPlaying: await _movieRepository.fetchNowPlayingMovies(),
      topRate: await _movieRepository.fetchTopRateMovies(),
      upcoming: await _movieRepository.fetchUpcomingMovies(),
    );
  }
}

final movieViewModelProvider =
    AsyncNotifierProvider<MovieViewModel, MovieState>((MovieViewModel.new));
