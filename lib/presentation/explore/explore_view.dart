import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/constants.dart';
import 'package:instagram_clone/presentation/explore/widgets/explore_image.dart';
import 'package:instagram_clone/presentation/explore/widgets/explore_search.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight,
              const Padding(
                padding: EdgeInsets.only(
                  left: 6,
                  right: 6,
                ),
                child: ExploreSearch(),
              ),
              kminheight,
              Expanded(
                  child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: List.generate(
                  21,
                  (index) => const ExploreImage(
                      url:
                          'https://e1.pxfuel.com/desktop-wallpaper/136/683/desktop-wallpaper-peaky-blinders-iphone-iphone-peaky-blinders.jpg'),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
