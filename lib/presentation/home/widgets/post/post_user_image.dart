import 'package:flutter/material.dart';

const storyImageUrl = 'https://wallpaperaccess.com/full/2560742.jpg';

class PostUserImage extends StatelessWidget {
  const PostUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: CircleAvatar(
        child: Container(
            width: 30,
            height: 30,
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
