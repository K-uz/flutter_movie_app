import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_movie_app/features/movie/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/features/movie/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/features/movie/data/dto/movie_dto.dart';

class MovieDataSourceImpl implements MovieDataSource {
  MovieDataSourceImpl({required Dio dio, required String apiKey})
      : _dio = dio,
        _apiKey = apiKey;

  final Dio _dio;
  final String _apiKey;

  @override
  Future<List<MovieDto>> fetchPopularMovies() async {
    //
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/popular',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
          },
        ),
        queryParameters: {
          'language': 'ko-KR',
        },
      );
      log('fetchPopularMoviesStatusCode : ${response.statusCode}');
      if (response.statusCode == 200) {
        final results = response.data['results'];
        final result = List.from(results).map((e) {
          return MovieDto.fromJson(e);
        }).toList();
        return result;
      }
      return [];
    } catch (e) {
      log('$e');
      return [];
    }
  }

  @override
  Future<List<MovieDto>> fetchUpcomingMovies() async {
    //
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/upcoming',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
          },
        ),
        queryParameters: {
          'language': 'ko-KR',
        },
      );
      log('fetchUpcomingMoviesStatusCode : ${response.statusCode}');
      if (response.statusCode == 200) {
        final results = response.data['results'];
        final result = List.from(results).map((e) {
          return MovieDto.fromJson(e);
        }).toList();
        return result;
      }
      return [];
    } catch (e) {
      log('$e');
      return [];
    }
  }

  @override
  Future<List<MovieDto>> fetchTopRateMovies() async {
    //
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/top_rated',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
          },
        ),
        queryParameters: {
          'language': 'ko-KR',
        },
      );
      log('fetchTopRateMoviesStatueCode : ${response.statusCode}');
      if (response.statusCode == 200) {
        final results = response.data['results'];
        final result = List.from(results).map((e) {
          return MovieDto.fromJson(e);
        }).toList();
        return result;
      }
      return [];
    } catch (e) {
      log('$e');
      return [];
    }
  }

  @override
  Future<List<MovieDto>> fetchNowPlayingMovies() async {
    //
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/now_playing',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
          },
        ),
        queryParameters: {
          'language': 'ko-KR',
        },
      );
      log('fetchNowPlayingMoviesStatueCode : ${response.statusCode}');
      if (response.statusCode == 200) {
        final results = response.data['results'];
        final result = List.from(results).map((e) {
          return MovieDto.fromJson(e);
        }).toList();
        return result;
      }
      return [];
    } catch (e) {
      log('$e');
      return [];
    }
  }

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    //
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $_apiKey'},
        ),
        queryParameters: {
          'language': 'ko-KR',
        },
      );
      log('fetchMovieDetailStatusCode : ${response.statusCode}');
      if (response.statusCode == 200) {
        Map<String, dynamic> result = response.data;
        return MovieDetailDto.fromJson(result);
      }
      return null;
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<List<MovieDto>> fetchSearchedMovie(String title) async {
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/search/movie',
        options: Options(
          headers: {'Authorization': 'Bearer $_apiKey'},
        ),
        queryParameters: {
          'language': 'ko-KR',
          'query': title,
        },
      );
      log('fetchSearchedMovie : ${response.statusCode}');
      if (response.statusCode == 200) {
        final results = response.data['results'];
        final result = List.from(results).map((e) {
          return MovieDto.fromJson(e);
        }).toList();
        return result;
      }
      return [];
    } catch (e) {
      log('$e');
      return [];
    }
  }
}
