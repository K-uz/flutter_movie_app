import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
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
  final movieRepository = MovieRepositoryImpl();

  @override
  Future<MovieState> build() async {
    return MovieState(
      popular: await movieRepository.fetchPopularMovies(),
      nowPlaying: await movieRepository.fetchNowPlayingMovies(),
      topRate: await movieRepository.fetchTopRateMovies(),
      upcoming: await movieRepository.fetchUpcomingMovies(),
    );
  }
}

final movieViewModelProvider =
    AsyncNotifierProvider<MovieViewModel, MovieState>((MovieViewModel.new));
