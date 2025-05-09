import 'package:flutter_movie_app/data/service/movie_detail_service.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';

class MovieDetailRepository {
  final movieDetailService = MovieDetailService();
  final posterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  Future<MovieDetail?> getMovieDetail(int id) async {
    final movieDetailDto = await movieDetailService.fetchMovieDetail(id);
    if (movieDetailDto == null) return null;
    return MovieDetail(
      budget: movieDetailDto.budget,
      genres: (movieDetailDto.genres).map((e) => e.name).toList(),
      id: movieDetailDto.id,
      productionCompanyLogos: (movieDetailDto.productionCompanies)
          .map((e) => posterBaseUrl + e.logoPath)
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
    );
  }
}
