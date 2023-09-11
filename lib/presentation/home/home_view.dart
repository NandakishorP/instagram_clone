import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/constants.dart';
import 'package:instagram_clone/presentation/home/widgets/appbar/appbar_view.dart';
import 'package:instagram_clone/presentation/home/widgets/post/image_post.dart';
import 'package:instagram_clone/presentation/home/widgets/story/story_view.dart';
import 'package:instagram_clone/presentation/widgets/bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kheight,
              kminheight,
              const AppBarView(),
              kheight,
              const StoryView(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const ImagePost();
                  },
                  itemCount: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
