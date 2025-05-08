import 'package:flutter_movie_app/data/dto/movie_dto.dart';
import 'package:flutter_movie_app/data/model/movie.dart';
import 'package:flutter_movie_app/data/service/movie_service.dart';

class MovieRepository {
  final movieService = MovieService();

  Future<List<Movie>> mapDtosToMovies(Future<List<MovieDto>> toDto) async {
    final movieDtos = await toDto;
    return movieDtos.map((e) {
      return Movie(title: e.title, posterPath: e.posterPath);
    }).toList();
  }

  Future<List<Movie>> getPopularMovies() async {
    return mapDtosToMovies(movieService.fetchPopularMovies());
  }

  Future<List<Movie>> getUpcomingMovies() async {
    return mapDtosToMovies(movieService.fetchUpcomingMovies());
  }

  Future<List<Movie>> getTopRateMovies() async {
    return mapDtosToMovies(movieService.fetchTopRateMovies());
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    return mapDtosToMovies(movieService.fetchNowPlayingMovies());
  }
}
