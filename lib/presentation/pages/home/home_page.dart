import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail_page.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/popular_movie_list.dart';
import 'package:flutter_movie_app/presentation/viewmodel/movie_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final movieState = ref.watch(movieViewModelProvider);

          return movieState.when(
            data: (movies) {
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
                                  'https://picsum.photos/200/300',
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
                  MovieList(label: '현재 상영순'),
                  SizedBox(height: 20),
                  PopularMovieList(),
                  SizedBox(height: 20),
                  MovieList(label: '평점 높은 순'),
                  SizedBox(height: 20),
                  MovieList(label: '개봉예정'),
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
    );
  }
}
