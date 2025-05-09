import 'package:flutter_movie_app/data/model/movie.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Type {
  popular,
  nowPlaying,
  topRate,
  upcoming,
}

class MovieViewModel extends AsyncNotifier<Map<Type, List<Movie>>> {
  //
  MovieRepository movieRepository = MovieRepository();

  @override
  Future<Map<Type, List<Movie>>> build() async {
    return {
      Type.popular: await movieRepository.getPopularMovies(),
      Type.nowPlaying: await movieRepository.getNowPlayingMovies(),
      Type.topRate: await movieRepository.getTopRateMovies(),
      Type.upcoming: await movieRepository.getUpcomingMovies()
    };
  }
}

final movieViewModelProvider =
    AsyncNotifierProvider<MovieViewModel, Map<Type, List<Movie>>>(
        (MovieViewModel.new));
