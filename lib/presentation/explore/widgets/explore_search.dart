import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExploreSearch extends StatelessWidget {
  const ExploreSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.withOpacity(0.38),
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            border: InputBorder.none,
            prefixIcon: Transform.scale(
              alignment: Alignment.centerRight,
              scale: 0.6,
              child: const Padding(
                padding: EdgeInsets.all(7.5),
                child: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.white,
                ),
              ),
            )),
      ),
    );
  }
}
