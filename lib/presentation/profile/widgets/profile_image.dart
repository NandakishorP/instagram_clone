import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/home/widgets/post/post_user_image.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

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
