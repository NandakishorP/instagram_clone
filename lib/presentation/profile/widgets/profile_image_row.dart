import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/profile/widgets/profile_image.dart';

class ProfileImageRow extends StatelessWidget {
  const ProfileImageRow({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 85,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileImage(),
          Padding(
            padding: EdgeInsets.only(
              right: 10,
              left: 6,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '208',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Text(
                  'Posts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('2140',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.white,
                    )),
                Text('Followers',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('1870',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    )),
                Text('Following',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
