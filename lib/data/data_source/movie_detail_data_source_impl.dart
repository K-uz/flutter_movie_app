import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_detail_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';

class MovieDetailDataSourceImpl implements MovieDetailDataSource {
  MovieDetailDataSourceImpl({required Dio dio, required String apiKey})
      : _dio = dio,
        _apiKey = apiKey;

  final Dio _dio;
  final String _apiKey;

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    //
    final response = await _dio.get(
      'https://api.themoviedb.org/3/movie/$id',
      options: Options(
        headers: {'Authorization': 'Bearer $_apiKey'},
      ),
      queryParameters: {
        'language': 'ko-KR',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = response.data;
      return MovieDetailDto.fromJson(result);
    }
    return null;
  }
}
