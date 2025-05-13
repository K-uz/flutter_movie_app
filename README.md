# Flutter_movie_app

`현재 상영중` `인기순` `평점 높은순` `개봉예정` 중인 영화들을 한눈에 볼 수 있는 앱입니다.  
영화 포스터를 클릭 시 영화 상세 페이지로 이동합니다.

## 기술 스택

- Flutter 3.x
- Riverpod (상태관리)
- Dio (HTTP 통신)
- TMDB API (영화 데이터)

## 아키텍처

본 프로젝트는 **클린 아키텍처(Clean Architecture)** 기반으로 구성했습니다.

lib/  
├── data/ # data_source, dto, repository  
├── domain/ # entity, repository interface, usecase  
├── presentation/ # pages, providers, ViewModel  

--- 

## 설치 및 실행 방법

```bash
git clone https://github.com/k-ouz/flutter_movie_app.git
cd flutter_movie_app
flutter pub get
flutter run
