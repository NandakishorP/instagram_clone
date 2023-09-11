import 'package:flutter/material.dart';

const storyImageUrl = 'https://wallpaperaccess.com/full/2560742.jpg';

class StoryView extends StatelessWidget {
  const StoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const StoryImage();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: 20,
        ));
  }
}

class StoryImage extends StatelessWidget {
  const StoryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: const ClipOval(
              child: Image(
                image: NetworkImage(storyImageUrl),
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
