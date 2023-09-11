import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/presentation/constants.dart';
import 'package:instagram_clone/presentation/home/widgets/post/post_user_image.dart';

const postImageUrl =
    'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png';
const postUrl =
    'https://timesofindia.indiatimes.com/thumb/msid-97607226,width-1280,height-720,resizemode-4/97607226.jpg';

class ImagePost extends StatelessWidget {
  const ImagePost({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 700,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostwidgetTopbar(width: width),
          Container(
            width: width,
            height: 470,
            color: Colors.white,
            child: const Image(
              fit: BoxFit.cover,
              image: NetworkImage(postUrl),
            ),
          ),
          kminheight,
          const Padding(
            padding: EdgeInsets.only(left: 9),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.heart,
                  color: Colors.white,
                ),
                kwidth,
                kwidth,
                FaIcon(
                  FontAwesomeIcons.comment,
                  color: Colors.white,
                ),
                kwidth,
                kwidth,
                FaIcon(
                  FontAwesomeIcons.paperPlane,
                  color: Colors.white,
                ),
                SizedBox(width: 260),
                Icon(
                  OctIcons.bookmark_16,
                  color: Colors.white,
                )
              ],
            ),
          ),
          kminheight,
          const Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text(
              '10000000 likes ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 8,
            ),
            child: Row(
              children: [
                Text(
                  'manchesterunited',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kminwidth,
                Text(
                  "The Duo's are back",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          kminheight,
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'View all 47 commnets',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          kminheight,
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Row(
              children: [
                PostUserImage(),
                kwidth,
                Text(
                  'Add a comment',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          kminheight,
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '16 minutes ago',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostwidgetTopbar extends StatelessWidget {
  const PostwidgetTopbar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: Row(
        children: [
          kminwidth,
          const PostUserImage(),
          kwidth,
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kminheight,
              Text(
                'manchesterunited ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: .5,
                ),
              ),
              Text(
                'Manchester, United Kingdom',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 159,
          ),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomSheetWidget(
                      width: width,
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 430,
        color: Colors.black.withOpacity(0.78),
        child: ListView(
          children: const [
            kdoubleheight,
            kminheight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomButtonBarWidget(
                  iconSize: 15,
                  width: 65,
                  icon: Icon(
                    OctIcons.bookmark_16,
                    color: Colors.white,
                  ),
                  text: 'Save',
                ),
                BottomButtonBarWidget(
                  iconSize: 15,
                  width: 65,
                  icon: Icon(
                    Icons.qr_code,
                    color: Colors.white,
                  ),
                  text: 'QR code',
                ),
              ],
            ),
            kdoubleheight,
            Divider(
              height: 8,
              color: Colors.grey,
            ),
            kdoubleheight,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextWidget(
                text: "Why you're seeing this post",
                color: Colors.white,
                fontweight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            kdoubleheight,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextWidget(
                  text: "Not intrested",
                  color: Colors.white,
                  fontweight: FontWeight.w500,
                  fontSize: 17),
            ),
            kdoubleheight,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextWidget(
                text: "About this content",
                color: Colors.white,
                fontweight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            kdoubleheight,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextWidget(
                text: "Report",
                color: Colors.white,
                fontweight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            kdoubleheight,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextWidget(
                text: "Manage suggested content",
                color: Colors.white,
                fontweight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ],
        ));
  }
}

class BottomButtonBarWidget extends StatelessWidget {
  const BottomButtonBarWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.width,
    required this.iconSize,
  });
  final Icon icon;
  final String text;
  final double width;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Transform.scale(
              scale: 0.9,
              child: IconButton(
                onPressed: () {},
                icon: icon,
                iconSize: iconSize,
              ),
            ),
          ),
        ),
        kminheight,
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
