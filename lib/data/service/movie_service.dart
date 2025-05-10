import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/dto/movie_dto.dart';

class MovieService {
  final _dio = Dio();
  final apiKey = dotenv.env['TMDB_API_KEY'];

  Future<List<MovieDto>> fetchPopularMovies() async {
    //
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/popular',
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
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

  Future<List<MovieDto>> fetchUpcomingMovies() async {
    //
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/upcoming',
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
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

  Future<List<MovieDto>> fetchTopRateMovies() async {
    //
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/top_rated',
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
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

  Future<List<MovieDto>> fetchNowPlayingMovies() async {
    //
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/now_playing',
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
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
}
