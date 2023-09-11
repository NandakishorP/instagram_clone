import 'package:flutter/material.dart';

const kheight = SizedBox(
  width: 100,
  height: 15,
);

const kwidth = SizedBox(
  width: 10,
);
const kminwidth = SizedBox(
  width: 4,
);

const kminheight = SizedBox(
  height: 7,
);

const kdoublewidth = SizedBox(
  width: 15,
);
const kdoubleheight = SizedBox(
  height: 15,
);

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.fontweight,
      required this.fontSize});
  final String text;
  final Color color;
  final FontWeight fontweight;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontweight,
        fontSize: fontSize,
      ),
    );
  }
}
