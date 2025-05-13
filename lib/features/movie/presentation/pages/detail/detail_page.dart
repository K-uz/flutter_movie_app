import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/movie/presentation/pages/detail/widgets/box_office_info.dart';
import 'package:flutter_movie_app/features/movie/presentation/pages/detail/widgets/category.dart';
import 'package:flutter_movie_app/features/movie/presentation/pages/detail/widgets/company_logo.dart';
import 'package:flutter_movie_app/features/movie/presentation/viewmodel/movie_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.tag,
    required this.id,
    required this.posterPath,
  });

  final String tag;
  final int id;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    log('selectedMovieId : $id');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final movieDetailState = ref.watch(movieDetailViewModelProvider(id));
          return movieDetailState.when(
            data: (movieDetail) {
              if (movieDetail == null) {
                return Center(
                  child: Text('상세 설명이 없습니다.'),
                );
              }
              return ListView(
                children: [
                  Hero(
                    tag: tag,
                    child: Image.network(
                      posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 20, 14, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              movieDetail.title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(movieDetail.releaseDate
                                .toString()
                                .substring(0, 10)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(movieDetail.tagline),
                        Text('${movieDetail.runtime}분'),
                        const Divider(height: 20),
                        Category(category: movieDetail.genres),
                        const Divider(height: 20),
                        Text(
                          movieDetail.overview,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const Divider(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: const Text(
                                '흥행정보',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BoxOfficeInfo(
                              //voteAverage, voteCount, popularity, budget, revenue
                              boxOfficeInfo: movieDetail.boxOfficeInfo,
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                        CompanyLogo(
                          companyLogo: movieDetail.productionCompanyLogos,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, stack) => Center(
              child: Text('Error: $e'),
            ),
          );
        },
      ),
    );
  }
}
