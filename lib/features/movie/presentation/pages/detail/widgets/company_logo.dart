import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({
    super.key,
    required this.companyLogo,
  });

  final List<String> companyLogo;
  final posterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: companyLogo.length,
        itemBuilder: (context, index) {
          return (posterBaseUrl.length != companyLogo[index].length)
              ? SizedBox(
                  width: 200,
                  child: Image.network(
                    companyLogo[index],
                    fit: BoxFit.fill,
                  ),
                )
              : SizedBox();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
      ),
    );
  }
}
