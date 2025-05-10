import 'package:flutter/material.dart';

class BoxOfficeInfo extends StatelessWidget {
  const BoxOfficeInfo({
    super.key,
    required this.boxOfficeInfo,
  });

  final List<Map<String, dynamic>> boxOfficeInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: boxOfficeInfo.length,
        itemBuilder: (context, index) {
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${boxOfficeInfo[index].values}'),
                  Text('${boxOfficeInfo[index].keys}'),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
      ),
    );
  }
}
