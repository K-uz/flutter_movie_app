import 'package:flutter/material.dart';

class BoxOfficeInfo extends StatelessWidget {
  const BoxOfficeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('data'),
                Text('label'),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 20);
        },
      ),
    );
  }
}
