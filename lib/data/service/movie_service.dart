import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/dto/movie_dto.dart';

class MovieService {
  final _dio = Dio();
  final apiKey = dotenv.env['TDBM_API_KEY'] ?? '';

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
      if (response.statusCode == 200) {
        return List.from(response.data).map((e) {
          return MovieDto.fromJson(e);
        }).toList();
      }
      return [];
    } catch (e) {
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
      if (response.statusCode == 200) {
        return List.from(response.data).map((e) {
          return MovieDto.fromJson(e);
        }).toList();
      }
      return [];
    } catch (e) {
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
      if (response.statusCode == 200) {
        return List.from(response.data).map((e) {
          return MovieDto.fromJson(e);
        }).toList();
      }
      return [];
    } catch (e) {
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
      if (response.statusCode == 200) {
        return List.from(response.data).map((e) {
          return MovieDto.fromJson(e);
        }).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
