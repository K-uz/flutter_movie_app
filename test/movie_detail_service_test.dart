import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/service/movie_detail_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    await dotenv.load(fileName: '.env'); // .env 파일 로드
  });

  test('movieDetailServiceTest', () async {
    MovieDetailService movieDetailService = MovieDetailService();
    final movieDetail = await movieDetailService.fetchMovieDetail(1233069);

    expect(movieDetail, isNotNull);
    expect(movieDetail!.title, isNotEmpty);

    print('제목: ${movieDetail.title}');
    print('${movieDetail.genres[0].name}');
    print('${movieDetail.productionCompanies[0].logoPath}');
  });
}
