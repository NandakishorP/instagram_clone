import 'package:flutter/material.dart';

const exploreImageUrl =
    'https://imgix.bustle.com/wmag/2016/12/16/58536340e3d613c03e1eb340_PB3-1.jpg?w=900&h=600&fit=crop&crop=faces&auto=format%2Ccompress&q=50&dpr=2';

class ExploreImage extends StatelessWidget {
  const ExploreImage({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 155,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.38),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
