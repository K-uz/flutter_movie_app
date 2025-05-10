import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.category,
  });

  final List<String> category;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              category[index],
              style: TextStyle(
                color: Colors.blue,
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
