import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_dto.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({required MovieDataSource movieDataSource})
      : _movieDataSource = movieDataSource;

  final MovieDataSource _movieDataSource;
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

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final movieDetailDto = await _movieDataSource.fetchMovieDetail(id);
    if (movieDetailDto == null) return null;
    return MovieDetail(
      budget: movieDetailDto.budget,
      genres: (movieDetailDto.genres).map((e) => e.name).toList(),
      id: movieDetailDto.id,
      productionCompanyLogos: (movieDetailDto.productionCompanies)
          .map((e) => _posterBaseUrl + e.logoPath)
          .toList(),
      overview: movieDetailDto.overview,
      popularity: movieDetailDto.popularity,
      releaseDate: movieDetailDto.releaseDate,
      revenue: movieDetailDto.revenue,
      runtime: movieDetailDto.runtime,
      tagline: movieDetailDto.tagline,
      title: movieDetailDto.title,
      voteAverage: movieDetailDto.voteAverage,
      voteCount: movieDetailDto.voteCount,

      // voteAverage, voteCount, popularity, budget, revenue
      boxOfficeInfo: [
        {'평점': movieDetailDto.voteAverage},
        {'평점 득표수': movieDetailDto.voteCount},
        {'인기점수': movieDetailDto.popularity},
        {'예산': movieDetailDto.budget},
        {'수익': movieDetailDto.revenue}
      ],
    );
  }
}
