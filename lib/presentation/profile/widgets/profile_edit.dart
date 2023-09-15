import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/constants.dart';
import 'package:instagram_clone/presentation/profile/widgets/profile_image.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ProfileEditTopBar(),
                kheight,
                kminheight,
                const ProfileImage(),
                kheight,
                const TextWidget(
                  text: 'Edit profile or avatar',
                  color: Colors.blue,
                  fontweight: FontWeight.w400,
                  fontSize: 15,
                ),
                kdoubleheight,
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                const BioText(
                  height: 50,
                  sizedboxwidth: 40,
                  text: 'HK',
                  color: Colors.white,
                  title: 'Name',
                ),
                const BioText(
                  height: 50,
                  text: 'hk_rox_1165',
                  color: Colors.white,
                  title: 'Username',
                  sizedboxwidth: 29,
                ),
                const BioText(
                    height: 150,
                    text:
                        " Wish me on July 11..! \n SSMIT-2021 \n NIKETANIE-2023 \n AVV -2027",
                    color: Colors.white,
                    title: 'Bio',
                    sizedboxwidth: 60),
                const BioText(
                  height: 50,
                  text: 'Add links',
                  color: Colors.grey,
                  title: 'Links',
                  sizedboxwidth: 49,
                ),
                kdoubleheight,
                kdoubleheight,
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Switch to personal account',
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'personal information settings',
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileEditTopBar extends StatelessWidget {
  const ProfileEditTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            )),
        const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}

class BioText extends StatelessWidget {
  const BioText(
      {super.key,
      required this.height,
      required this.text,
      required this.color,
      required this.title,
      required this.sizedboxwidth});
  final double height;
  final String text;
  final double sizedboxwidth;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        height: height,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: sizedboxwidth,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  text,
                  style: TextStyle(color: color),
                ))
          ]),
        ));
  }
}
