import 'package:flutter_movie_app/data/data_source/movie_detail_data_source.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_detail_repository.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  MovieDetailRepositoryImpl(
      {required MovieDetailDataSource movieDetailDataSource})
      : _movieDetailDataSource = movieDetailDataSource;

  final MovieDetailDataSource _movieDetailDataSource;
  final String _posterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final movieDetailDto = await _movieDetailDataSource.fetchMovieDetail(id);
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
