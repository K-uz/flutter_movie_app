import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_dto.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource = MovieDataSourceImpl(dio: Dio());
  final String _posterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  Future<List<Movie>> mapDtosToMovies(
      Future<List<MovieDto>> moviedataSource) async {
    final movieDtos = await moviedataSource;
    return movieDtos.map((e) {
      return Movie(
          id: e.id, title: e.title, posterPath: _posterBaseUrl + e.posterPath);
    }).toList();
  }

  @override
  Future<List<Movie>> fetchNowPlayingMovies() async {
    return await mapDtosToMovies(_movieDataSource.fetchNowPlayingMovies());
  }

  @override
  Future<List<Movie>> fetchPopularMovies() async {
    return await mapDtosToMovies(_movieDataSource.fetchPopularMovies());
  }

  @override
  Future<List<Movie>> fetchTopRateMovies() async {
    return await mapDtosToMovies(_movieDataSource.fetchTopRateMovies());
  }

  @override
  Future<List<Movie>> fetchUpcomingMovies() async {
    return await mapDtosToMovies(_movieDataSource.fetchUpcomingMovies());
  }
}
