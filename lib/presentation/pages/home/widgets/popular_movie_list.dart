import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail_page.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '인기순',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      width: 150,
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(
                              tag: 'popular_movie_$index',
                            );
                          }));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Hero(
                            tag: 'popular_movie_$index',
                            child: Image.network(
                              'https://picsum.photos/200/300',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: -30,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
