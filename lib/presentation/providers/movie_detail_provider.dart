import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/data_source/movie_detail_data_source_impl.dart';
import 'package:flutter_movie_app/data/repository/movie_detail_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _movieDetailDataSourceProvider = Provider((ref) {
  final dio = Dio();
  return MovieDetailDataSourceImpl(
      dio: dio, apiKey: dotenv.env['TMDB_API_KEY']!);
});

final movieDetailRepositoryProvider = Provider((ref) {
  final movieDetailDataSource = ref.read(_movieDetailDataSourceProvider);
  return MovieDetailRepositoryImpl(
      movieDetailDataSource: movieDetailDataSource);
});
