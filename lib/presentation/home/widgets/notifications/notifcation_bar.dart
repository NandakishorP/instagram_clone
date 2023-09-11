import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/presentation/constants.dart';
import 'package:instagram_clone/presentation/home/widgets/appbar/chat/chat.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeftLong,
            )),
        title: Row(
          children: [
            const Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            const SizedBox(
              width: 120,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Filter',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ))
          ],
        ),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) {
                return const NotificationFollowing();
              },
              separatorBuilder: (context, index) {
                return kheight;
              },
              itemCount: 20,
            )),
          ],
        ),
      ),
    );
  }
}

class NotificationFollowing extends StatelessWidget {
  const NotificationFollowing({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: const Row(
        children: [
          ChatImage(width: 45, height: 45),
          kdoublewidth,
          kwidth,
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'adhi  ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            TextSpan(
                text: 'started following \n you ',
                style: TextStyle(color: Colors.white, fontSize: 15))
          ])),
          SizedBox(
            width: 70,
          ),
          FollowNotification()
        ],
      ),
    );
  }
}

class FollowNotification extends StatelessWidget {
  const FollowNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 35,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {},
        child: const Text(
          'Follow',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
