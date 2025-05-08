import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/box_office_info.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/company_logo.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.tag,
  });
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Hero(
              tag: tag,
              child: Image.network(
                'https://picsum.photos/200/300',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('title'),
                Text('releaseDate'),
              ],
            ),
            Text('tagLine'),
            Text('runningTIme'),
            Text('category'),
            Text('description' * 30),
            BoxOfficeInfo(),
            CompanyLogo(),
          ],
        ));
  }
}
