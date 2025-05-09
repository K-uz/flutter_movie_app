import 'package:flutter_movie_app/data/model/movie.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
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
  MovieRepository movieRepository = MovieRepository();

  @override
  Future<MovieState> build() async {
    return MovieState(
      popular: await movieRepository.getPopularMovies(),
      nowPlaying: await movieRepository.getNowPlayingMovies(),
      topRate: await movieRepository.getTopRateMovies(),
      upcoming: await movieRepository.getUpcomingMovies(),
    );
  }
}

final movieViewModelProvider =
    AsyncNotifierProvider<MovieViewModel, MovieState>((MovieViewModel.new));
