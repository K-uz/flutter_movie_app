import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/features/movie/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/features/movie/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/features/movie/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_app/features/movie/domain/repository/movie_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  final dio = Dio();
  return MovieDataSourceImpl(dio: dio, apiKey: dotenv.env['TMDB_API_KEY']!);
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final movieDataSource = ref.read(_movieDataSourceProvider);
  return MovieRepositoryImpl(movieDataSource: movieDataSource);
});
