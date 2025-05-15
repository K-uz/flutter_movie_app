import 'package:dio/dio.dart';
import 'package:flutter_movie_app/features/movie/data/data_source/movie_data_source_impl.dart';
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
                {
                  "page": 1,
                  "results": [
                    {
                      "adult": false,
                      "backdrop_path": "/tVCg0HYPLFVYljiQXJCWTY43LJR.jpg",
                      "genre_ids": [18],
                      "id": 760497,
                      "original_language": "ko",
                      "original_title": "승부",
                      "overview":
                          "세계 최고 바둑 대회에서 국내 최초 우승자가 된 조훈현. 전 국민적 영웅으로 대접받던 그는 바둑 신동이라 불리는 이창호를 제자로 맞는다. 제자와 한 지붕 아래에서 먹고 자며 가르친 지 수년. 모두가 스승의 뻔한 승리를 예상했던 첫 사제 대결에서 조훈현은 전 국민이 지켜보는 가운데, 기세를 탄 제자에게 충격적으로 패한다. 오랜만에 패배를 맛본 조훈현과 이제 승부의 맛을 알게 된 이창호. 조훈현은 타고난 승부사적 기질을 되살리며 다시 한번 올라갈 결심을 하게 되는데…",
                      "popularity": 36.8088,
                      "poster_path": "/x1xHVv5rdvvCjF5wmGhtbHrlUgo.jpg",
                      "release_date": "2025-03-26",
                      "title": "승부",
                      "video": false,
                      "vote_average": 7.0,
                      "vote_count": 24
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/hZoXUcBN0CgD7s1QgmO7OZSHzBx.jpg",
                      "genre_ids": [18],
                      "id": 18925,
                      "original_language": "en",
                      "original_title": "Facing the Giants",
                      "overview":
                          "이기든 지든...\r 주께 영광 돌립니다\r 두려움을 이겨낸 하나님과의 동행  샤일로 기독학교의 미식 축구팀 감독 테일러는  인생 최대의 위기를 맞고 있다.\r 가정에서의 문제, 계속 지기만 하는 미식 축구 팀,\r 심지어 자신의 직장까지 위협받게 되지만,\r 그는 혼자가 아니였다.  이기든 지든 하나님께 영광을 돌리기 위해\r 팀과 함께 목적을 새로인 한 그에게  놀라운 변화가 일어나기 시작한다.",
                      "popularity": 2.8351,
                      "poster_path": "/1eY8O7fIGcmwetNqvwnnkQB0LYK.jpg",
                      "release_date": "2006-09-29",
                      "title": "믿음의 승부",
                      "video": false,
                      "vote_average": 7.5,
                      "vote_count": 451
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/waUvIPIUxDRZOigwjEEOWGVIPDX.jpg",
                      "genre_ids": [18, 10749],
                      "id": 30069,
                      "original_language": "en",
                      "original_title": "Vision Quest",
                      "overview":
                          "레슬링 선수인 18세의 로덴 스웨인은 자신의 체급에선 최고이지만 두 체급 아래의 챔피언인 슈트에게 도전하기 위해 코치의 반대에도 불구하고 피나는 체중 감량을 시작한다. 그러던 중 로덴은 LA 에 사는 언니를 만나러 가다가 차가 고장나는 바람에 곤란해 하고 있는 칼라를 자신의 집에 재워주게 되고, 아버지와 단 둘이서만 살던 로덴은 여자가 집에 있게 되자 어딘가 달라진 것을 느끼게 되는데..그녀에게 향하는 관심은 100 퍼센트 집중해도 될까 말까한 훈련에 자꾸 방해만 된다. 결국 로덴은 칼라와 사랑에 빠져 버리고, 칼라도 레슬링도 모두 포기 할 수 없는 각오와 함께 슈트와의 게임을 맞이하게 되는데..",
                      "popularity": 1.6448,
                      "poster_path": "/l3g4e6ocqGA8aNL1hIrIVWLkljL.jpg",
                      "release_date": "1985-02-15",
                      "title": "청춘의 승부",
                      "video": false,
                      "vote_average": 6.399,
                      "vote_count": 129
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/opkaX1d1uvkgzN9dAHYjDeUWFgW.jpg",
                      "genre_ids": [18, 80],
                      "id": 1117061,
                      "original_language": "tl",
                      "original_title": "Hugot",
                      "overview":
                          "농구 선수에서 마약 밀매와 도박에 빠지게 되는 주인공  농구 선수였던 주인공이 더 많은 돈을 벌기 위해 마약 밀매와 도박에 손을 댄다. 하지만 그는 자신의 행동이 자신 뿐만 아니라 사랑하는 사람들의 삶까지 위협한다는 것을 깨닫게 되는데…",
                      "popularity": 1.4137,
                      "poster_path": "/o41ILbawHo3uuXklzIG9h2BvyUU.jpg",
                      "release_date": "2023-06-30",
                      "title": "스캔들: 위험한 승부",
                      "video": false,
                      "vote_average": 4.333,
                      "vote_count": 3
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/fO2ulA6piUHhKDSiQvC1ulYwZgR.jpg",
                      "genre_ids": [18, 10749, 37],
                      "id": 18069,
                      "original_language": "en",
                      "original_title": "8 Seconds",
                      "overview":
                          "오클라호마의 작은 마을에 사는 소년 레인 프로스트. 그는 젊은 시절 로데오경기 선구자였던 아버지 클라이드 프로스트의 아들로 전설적인 로데오 챔피언을 열망하던 아버지의 염원을 물려 받는다. 거대한 황소 위에 있는 작은 아들의 모습이 범상치 않음을 발견한 클라이드는 레인에게 일찍부터 엄격한 로데오 훈련을 시킨다. 열 여덟살 되던 해, 레인은 친구 터프 헤드만, 코디 램버트와 한 팀이 되어 첫 로데오 경기에 참석한다. 타고난 용모와 특유의 과감성으로 레인은 로데오계의 새 별로 급부상하고, 야생마 타기 부문 챔피언인 켈리를 만나 첫눈에 반하게 된다.사랑에 빠진 두사람은 어린 나이에 결혼을 해 가정을 꾸미고, 레인은 켈리의 도움에 힘입어 참가하는 경기마다 우승을 거두어 선전한다. 그러나 늘상 떨어져 사는 결혼 생활과 우승에 대한 중압감때문에 레인은 슬럼프에 빠지게 되고 그런 레인에게 친구 터프는 라스베가스 게임에 도전해 볼 것을 권유한다. 그것은 바로 33명의 전직 챔피언을 해치운 황소 레드록과의 결전이다. 반면 케리 역시 유명한 로데오 선수인 남편의 그늘에 가려 조금씩 지쳐간다. 그러던 어느날, 범민하던 켈리 앞에 옛 애인 마틴이 나타난다. 레드록과의 시합을 하루 남겨놓은 날, 질투에 휩싸인 레인은 이 일로 켈리와 심하게 다투게 되는데...",
                      "popularity": 1.1525,
                      "poster_path": "/wqKVkOveZrK6zwfrptGLVPmnMpR.jpg",
                      "release_date": "1994-02-25",
                      "title": "8초의 승부",
                      "video": false,
                      "vote_average": 7.3,
                      "vote_count": 96
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/rBlbtWJplSENxaB82apO5tolUQI.jpg",
                      "genre_ids": [80],
                      "id": 33927,
                      "original_language": "en",
                      "original_title": "Deadfall",
                      "overview":
                          "죠(Joe: 마이클 빈 분)와 그의 아버지는 법에 쫓기며 사는 사기꾼이다. 그러나 엉성하게 사기를 치다 죽게 된 아버지는 마지막 유언에서, 있는 줄도 몰랐던 삼촌을 찾아가라고 하는데, 그 덕분에 아들은 더 황당한 세계로 빠져든다. 루 삼촌은 아버지와 쌍동이였는데, 지금은 로스엔젤레스 지하 세계가 활동무대이고, 그의 부하 에디(Eddie: 니콜라스 케이지 분)는 폭력을 즐기는 싸이코같은 놈이다.  에디의 애인 다이엔(Diane: 사라 트리거 분)은 원하는 것을 차지하기 위해서는 물불 안가리고 달려드는 무시무시한 여자다. 다이엔은 곧 죠를 유혹하는데, 이게 일부러 에디를 화나게 해서 죠를 혼내려는 것인지 아니면 진짜로 죠를 좋아하는 것인지 알 수가 없다. 루 삼촌은 2백만불 짜리 작전을 짜고, 죠는 현찰에 끌리고 그러나 이 사건에는 돈 문제 이외에도 다른 문제가 얽혀드는데...",
                      "popularity": 0.9334,
                      "poster_path": "/8S1lqwp1RR9z0V05QAVWTSbvtwC.jpg",
                      "release_date": "1993-10-08",
                      "title": "단판 승부",
                      "video": false,
                      "vote_average": 4.068,
                      "vote_count": 74
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/mmONYtzw169nRkeZgBIhze8zOMy.jpg",
                      "genre_ids": [18, 10751],
                      "id": 355655,
                      "original_language": "en",
                      "original_title": "Catching Faith",
                      "overview":
                          "잘 나가는 남편과 미식축구 천재 아들, 전교1등 딸을 둔 알렉사. 완벽하던 그녀의 삶이 아버지의 죽음을 시작으로 크게 흔들린다. 알렉사와 가족들은 연이어 터지는 문제와 싸우며 신의 자녀로서 올바른 정체성과 인간관계를 찾아가는 믿음의 승부를 시작한다.",
                      "popularity": 0.3487,
                      "poster_path": "/xveoMAW1Lv4LIw2aIcaFKMISt19.jpg",
                      "release_date": "2015-08-18",
                      "title": "믿음의 승부",
                      "video": false,
                      "vote_average": 6.2,
                      "vote_count": 21
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/bXORDijbHKFCfBbIM0oCPNvHkBZ.jpg",
                      "genre_ids": [80, 28, 53],
                      "id": 367195,
                      "original_language": "cn",
                      "original_title": "S風暴",
                      "overview":
                          "홍콩의 부패방지국 ICAC의 수석 조사관 육지렴은 익명의 제보를 받고 홍콩 마사회 비리 사건을 수사한다. 그러나 수사 진행 도중 단순 비리 사건이 살인 사건으로 번지자 경찰과 공조 수사를 하게 되고, 육지렴은 기밀 정보를 누설할 수 없다는 핑계로 강력계 장인 류보강과 사사건건 충돌한다. 그 와중에 결정적인 단서가 나올 때마다 의문의 킬러가 사건의 실마리를 쥐고 있는 인물들을 살해해 수사는 점점 미궁에 빠진다. 한편, 류보강은 한때 도박에 빠져 어머니와 여동생을 버린 대가를 혹독히 치르며 여동생과 화해하기 위해 애쓰던 중 여동생을 위험에 빠트리고 마는데…",
                      "popularity": 0.6471,
                      "poster_path": "/7Fc5wAIAVQKqXadLH6moCxWqZrE.jpg",
                      "release_date": "2016-09-14",
                      "title": "제트스톰2: 승부조작단",
                      "video": false,
                      "vote_average": 5.6,
                      "vote_count": 24
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/kLNS5oNxWE2vpZNbr0wQ8M2RifQ.jpg",
                      "genre_ids": [35, 16],
                      "id": 305143,
                      "original_language": "ja",
                      "original_title": "クレヨンしんちゃん ガチンコ!逆襲のロボとーちゃん",
                      "overview":
                          "어느 날, 로봇이 되어 돌아온 짱구 아빠!  짱구는 그 동안 영화에서만 봤던 슈퍼히어로가 되어 특별한 능력을 보여주는 로봇 아빠가 자랑스럽다. 그러나 갑자기 무시무시한 모습으로 변하는 로봇 아빠와 함께 떡잎마을을 무너뜨리려는 거대한 음모가 드러나는데…  과연, 로봇 아빠와 짱구 가족은 마을의 평화를 지켜낼 수 있을까?  가족의 운명을 건 거대한 전쟁이 시작된다!",
                      "popularity": 1.7989,
                      "poster_path": "/68MbkzLLX0cwOGg8eeaYF10zpRR.jpg",
                      "release_date": "2014-04-19",
                      "title": "극장판 짱구는 못말려: 정면승부! 로봇아빠의 역습",
                      "video": false,
                      "vote_average": 7.66,
                      "vote_count": 47
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/swXvzkH1oSVHh4flmcthXnusbwc.jpg",
                      "genre_ids": [18],
                      "id": 14291,
                      "original_language": "en",
                      "original_title": "Searching for Bobby Fischer",
                      "overview":
                          "체스에 천부적인 재능을 가진 소년이 승부욕에 칩착하는 아버지에 의해 승리에 대한 부담감과 패배에 대한 두려움을 갖게 되지만 현명한 엄마와 훌륭한 스승, 그리고 인간미 넘치는 체스 도박꾼의 도움으로 점점 극복하는 과정을 그린다.",
                      "popularity": 1.8009,
                      "poster_path": "/oAJpHkMpfXiFY9F3HocIz9fhHLc.jpg",
                      "release_date": "1993-08-13",
                      "title": "위대한 승부",
                      "video": false,
                      "vote_average": 7.1,
                      "vote_count": 584
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/rxzW3JbiF37qxc0TBJ2yUlNLvVz.jpg",
                      "genre_ids": [18],
                      "id": 194875,
                      "original_language": "en",
                      "original_title": "P.K. and the Kid",
                      "overview":
                          "P.K. runs away from home because her step-father keeps on harassing her sexually and her mother is ignoring the problem. She hides in the loading space of Kid Kane's pickup, who's on the way to the world championships in arm-wrestling. When he discovers her, he wants to send her home at first, but after he knows the story he takes her with him - and gets himself into big trouble: her step-father is behind them furiously, trying to kidnap her and take revenge for the stress he got from her mother.",
                      "popularity": 0.2141,
                      "poster_path": "/nAa5wgXYKUrm8M7whKX5hDvtd4d.jpg",
                      "release_date": "1987-01-06",
                      "title": "진정한 승부",
                      "video": false,
                      "vote_average": 5.0,
                      "vote_count": 2
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/8R7vPiYAS6s9Vwg4JBCIUHLkNPA.jpg",
                      "genre_ids": [99],
                      "id": 375860,
                      "original_language": "en",
                      "original_title": "The Surrounding Game",
                      "overview":
                          "아주 오랜 옛날부터 시작된 바둑은 단순한 규칙을 기반으로 한 인류 역사상 가장 복잡하고 멋진 게임이다. 수천년 동안 바둑은 인간 지성을 투영하는 창이 되어 왔는데, 이제 미국에서도 본격적으로 바둑에 뛰어들려고 한다. 바둑판을 뒤흔들 천재를 찾기 위한 행보가 펼쳐지는데...",
                      "popularity": 0.1338,
                      "poster_path": "/qKOp85iDsUOzNMZunFF0JnK0RGW.jpg",
                      "release_date": "2017-04-03",
                      "title": "서라운딩 게임 - 흑과 백의 승부사들",
                      "video": false,
                      "vote_average": 7.5,
                      "vote_count": 15
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/6O51sHUFjZrGSX0evVU3pq2yMMJ.jpg",
                      "genre_ids": [18],
                      "id": 337844,
                      "original_language": "en",
                      "original_title": "In Dubious Battle",
                      "overview":
                          "캘리포니아에서 사과수확을 하는 이주자들과 지역 농업인 협회간의 충돌로 인해 짐 놀란(제임스 프랑코)는 노동운동에 참여하게 된다",
                      "popularity": 0.9012,
                      "poster_path": "/bC7N0pUc6RzuDqSNHsV0VXk06Cq.jpg",
                      "release_date": "2016-10-08",
                      "title": "승부 없는 싸움",
                      "video": false,
                      "vote_average": 5.9,
                      "vote_count": 149
                    },
                    {
                      "adult": false,
                      "backdrop_path": null,
                      "genre_ids": [28],
                      "id": 204463,
                      "original_language": "ko",
                      "original_title": "죽음의 승부",
                      "overview":
                          "중공은 홍콩에 간첩망을 조직하기 위해 일천만불을 불상속에 감추고 홍콩에 반입한다. 이 정보를 입수한 팽,신따로 한동욱이 돈이 간첩들에게 인계되기 직전 가로채다가 경찰에 연행된다. 세월이 흘러 교도소에서 출감된 그들은 서로 불상을 찾으려고 혈안이 되어 있다. 속셈이 다른 세 사내의 위기와 배신으로 서로 엇갈리다가 한과 팽은 불상을 얻게 되지만 신따로의 배신으로 중공 간첩들의 습격을 받아 팽은 죽는다. 분노에 찬 한동욱은 신따로를 추격하여 마지막 승부를벌여 이기나 이미 불상은 제련소 용광로의 불꽃으로 일천만불과 함께 화해 버렸다.",
                      "popularity": 0.19,
                      "poster_path": "/vzUX4eiJVsxXQcDtZ5YYmKpUPfd.jpg",
                      "release_date": "1975-03-15",
                      "title": "죽음의 승부",
                      "video": false,
                      "vote_average": 2.0,
                      "vote_count": 1
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/mri275ksTOgYzfkBc2J6eqE6qEO.jpg",
                      "genre_ids": [16, 878],
                      "id": 68364,
                      "original_language": "ja",
                      "original_title": "ダーティペアの大勝負 ノーランディアの謎",
                      "overview":
                          "The Lovely Angels are dispatched to the planet of Ookbar in search of a missing girl. Kei and Yuri have traced young Missinie to the forest of Nolandia, but their investigations have stalled thanks to the less than helpful Chief of Security. But Kei and Yuri never let a little bureaucracy stand in their way. It's the unicorns and UFOs, not to mention the rampaging killer robot, that are going to be the problem as the Dirty Pair tackle their toughest case yet.",
                      "popularity": 0.3577,
                      "poster_path": "/l0V7kkv27rIQdLF8UyLm3DqqnMy.jpg",
                      "release_date": "1985-12-20",
                      "title": "더티페어의 대승부 노랜디아의 수수께끼",
                      "video": false,
                      "vote_average": 7.9,
                      "vote_count": 8
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/ajkwN6pLhQO2hbY3yCXdKc0VgDA.jpg",
                      "genre_ids": [28, 53, 18],
                      "id": 11690,
                      "original_language": "en",
                      "original_title": "Bloodsport",
                      "overview":
                          "프랭크(쟝-끌로드 반담)는 동양무술 쿠미데 대회에 참가하기 위해 부대를 탈영, 홍콩으로 향한다. 현역 군인으로서는 대회 출전이 불가능하지만 와병 중인 사범을 기쁘게 하고, 타나카류의 명예를 떨치려는 것이 그의 목적이었다. 한편 군당국은 헬머(노먼 버튼)와 로렌스(포레스트 휘테커)에게 그의 체포를 명령한다. 대망의 쿠미데 대회가 열리고 연일 체급을 무시한 무제한적인 대전이 벌어진다. 프랭크와 잭슨(도날드 깁)은 연승을 거듭한다. 그러나 잭슨이 챔피언 자리를 5년이나 석권한 청리(양사)에게 무참히 패하고, 큰 부상을 입자 드디어 프랭크와 결승전이 벌어진다. 프랭크는 비열한 공격을 가하는 청 리에게 시력을 잃으면서까지 대응, 마침내 항복을 받아내고 월계관을 움켜쥔다",
                      "popularity": 5.7323,
                      "poster_path": "/fiQoCdM3J2yVw7eJXwDfhy2DhwF.jpg",
                      "release_date": "1988-02-26",
                      "title": "투혼",
                      "video": false,
                      "vote_average": 7.029,
                      "vote_count": 1939
                    }
                  ],
                  "total_pages": 1,
                  "total_results": 16
                }
              },
              statusCode: 200,
            ));

    final result = await movieDataSourceImpl.fetchSearchedMovie('');

    expect(result.first.title, '승부');
  });
}
