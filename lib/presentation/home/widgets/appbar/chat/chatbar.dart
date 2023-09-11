import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatBar extends StatelessWidget {
  const ChatBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BottomAppBar(
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.83),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.camera,
                      color: Colors.white,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: 230,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Message...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic_outlined,
                  color: Colors.white,
                  size: 28,
                )),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.image,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
