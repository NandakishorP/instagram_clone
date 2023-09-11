import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/presentation/constants.dart';

class ProfileRowOne extends StatelessWidget {
  const ProfileRowOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 7),
          child: Text(
            'nandakishor_photography',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        const SizedBox(width: 40),
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(7),
              color: Colors.black),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
        kwidth,
        kwidth,
        const FaIcon(
          FontAwesomeIcons.bars,
          color: Colors.white,
        )
      ],
    );
  }
}
