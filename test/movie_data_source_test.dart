import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// MockDio 클래스 정의
class MockDio extends Mock implements Dio {}

void main() {
  late MockDio dio;
  late MovieDataSourceImpl movieDataSourceImpl;

  // setUp: 테스트 환경 설정
  setUp(() {
    dio = MockDio(); // MockDio 객체 생성
    movieDataSourceImpl =
        MovieDataSourceImpl(dio: dio, apiKey: ''); // MovieDataSourceImpl 객체 생성
  });

  test('mock_movie_data_source_test', () async {
    // dio.get 메서드 모킹
    when(() => dio.get(any(),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(
                path: '',
                headers: {},
              ),
              data: {
                'results': [
                  {
                    "adult": false,
                    "backdrop_path": "/cJvUJEEQ86LSjl4gFLkYpdCJC96.jpg",
                    "genre_ids": [10752, 28],
                    "id": 1241436,
                    "original_language": "en",
                    "original_title": "Warfare",
                    "overview":
                        "\"실화 기반, 전장의 숨결을 생생히 담아낸 리얼 타임 전쟁 드라마\"  2006년 이라크 라마디. 미 해군 특수부대 네이비 씰 팀이 적진 한복판에서 감시 임무를 수행하던 중, 예상치 못한 상황에 휘말리게 된다. 민가를 점거해 잠복하던 그들은 알카에다 세력의 포위망에 갇히고, 지원은 끊긴 채 생존을 위한 사투를 벌이게 된다. 전직 네이비 씰이자 실제 생존자인 레이 멘도자 감독과 '엑스 마키나', '시빌 워'의 알렉스 가란드 감독이 공동 연출한 이 작품은, 전투의 혼돈과 공포를 실시간으로 그려낸다. 화려한 음악이나 영웅 서사 없이, 전장의 소음과 침묵, 그리고 병사들의 숨결이 화면을 가득 채운다. 실화를 바탕으로 한 이 영화는, 전쟁의 참혹함과 인간의 생존 본능을 적나라하게 보여주며, 관객을 전장의 한가운데로 끌어들인다. 과연 이들은 살아남을 수 있을까...",
                    "popularity": 574.5249,
                    "poster_path": "/j8tqBXwH2PxBPzbtO19BTF9Ukbf.jpg",
                    "release_date": "2025-04-09",
                    "title": "워페어",
                    "video": false,
                    "vote_average": 7.125,
                    "vote_count": 228
                  }
                ]
              },
              statusCode: 200,
            ));

    final result = await movieDataSourceImpl.fetchNowPlayingMovies();

    expect(result[0].title, '워페어');
  });
}
