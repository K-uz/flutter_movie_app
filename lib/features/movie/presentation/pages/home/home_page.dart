import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/movie/presentation/pages/detail/detail_page.dart';
import 'package:flutter_movie_app/features/movie/presentation/pages/home/widgets/movie_list.dart';
import 'package:flutter_movie_app/features/movie/presentation/pages/home/widgets/popular_movie_list.dart';
import 'package:flutter_movie_app/features/movie/presentation/providers/movie_provider.dart';
import 'package:flutter_movie_app/features/movie/presentation/viewmodel/movie_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return TextFormField(
                decoration: InputDecoration(
                    hintText: '찾고싶은 영화 제목을 입력하세요',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
                controller: searchController,
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value;
                },
              );
            },
          ),
        ),
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final title = ref.watch(searchQueryProvider);
            final movieState = ref.watch(movieViewModelProvider(title));

            return movieState.when(
              data: (movies) {
                if (movies.searched.isNotEmpty) {
                  return ListView.builder(
                    itemCount: movies.searched.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(
                              tag: 'searched_movie',
                              id: movies.searched[index].id,
                              posterPath: movies.searched[index].posterPath,
                            );
                          }));
                        },
                        child: Text(movies.searched[index].title),
                      );
                    },
                  );
                }
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '가장 인기있는',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailPage(
                                  tag: 'favorite_movie',
                                  id: movies.popular[0].id,
                                  posterPath: movies.popular[0].posterPath,
                                );
                              }));
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Hero(
                                  tag: 'favorite_movie',
                                  child: Image.network(
                                    movies.popular[0].posterPath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    MovieList(label: '현재 상영순', movies: movies.nowPlaying),
                    SizedBox(height: 20),
                    PopularMovieList(movies: movies.popular),
                    SizedBox(height: 20),
                    MovieList(label: '평점 높은 순', movies: movies.topRate),
                    SizedBox(height: 20),
                    MovieList(label: '개봉예정', movies: movies.upcoming),
                  ],
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              error: (e, stack) => Center(
                child: Text('Error: $e'),
              ),
            );
          },
        ),
      ),
    );
  }
}
