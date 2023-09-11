import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/presentation/home/widgets/appbar/chat/chat.dart';
import 'package:instagram_clone/presentation/home/widgets/notifications/notifcation_bar.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final appbarWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: appbarWidth,
      height: 50,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            'Instagram',
            style: GoogleFonts.satisfy(
              color: Colors.white,
              fontSize: 38,
            ),
          ),
          const SizedBox(width: 140),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificationPage(),
              ));
            },
            icon: const FaIcon(
              FontAwesomeIcons.heart,
            ),
            color: Colors.white,
          ),
          Badge(
            label: const Text('3'),
            child: IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const ScreenChat();
                  },
                ));
              },
              icon: const FaIcon(
                FontAwesomeIcons.facebookMessenger,
              ),
            ),
          )
        ],
      ),
    );
  }
}
