import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/presentation/constants.dart';
import 'package:instagram_clone/presentation/home/widgets/appbar/chat/chatview.dart';
import 'package:instagram_clone/presentation/home/widgets/story/story_view.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeftLong,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                kdoublewidth,
                const Text(
                  'nandakishor_photography',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
                kminwidth,
                const Icon(
                  Icons.show_chart_sharp,
                  color: Colors.white,
                ),
                kwidth,
                kminwidth,
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: FaIcon(
                    FontAwesomeIcons.penToSquare,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            kminheight,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: const ExploreSearch(),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Filter',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
            kheight,
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: ChatViewPreview(),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatViewPreview extends StatelessWidget {
  const ChatViewPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ChatView(),
      )),
      child: Row(
        children: [
          const ChatImage(
            height: 55,
            width: 55,
          ),
          kdoublewidth,
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vinayak Vinod',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                '4+ new messages',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 170,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 28,
              ))
        ],
      ),
    );
  }
}

class ChatImage extends StatelessWidget {
  const ChatImage({super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        child: Container(
            width: width,
            height: height,
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

class ExploreSearch extends StatelessWidget {
  const ExploreSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.21,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
