import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/constants.dart';
import 'package:instagram_clone/presentation/explore/widgets/explore_image.dart';
import 'package:instagram_clone/presentation/profile/widgets/profile_image_row.dart';
import 'package:instagram_clone/presentation/profile/widgets/profile_row_one.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListView(
              children: [
                const ProfileRowOne(),
                kheight,
                ProfileImageRow(width: width),
                const Text(
                  'Nandakishor',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Photographer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Text(
                  '▶ Bird Photographer',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '▶ Every frame has something to tell',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "▶ I Don't Have  Dreams Only Aims ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                kheight,
                kminheight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 190,
                      height: 35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.grey.withOpacity(0.330)),
                        onPressed: () {},
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    kminwidth,
                    SizedBox(
                      width: 190,
                      height: 35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.grey.withOpacity(0.330)),
                        onPressed: () {},
                        child: const Text(
                          'Share Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                kdoubleheight,
                // Padding(
                //   padding: const EdgeInsets.only(left: 8),
                //   child: Container(
                //     width: 23,
                //     height: 73,
                //     decoration: BoxDecoration(
                //         border: Border.all(
                //           color: Colors.white,
                //           width: 2,
                //         ),
                //         borderRadius: BorderRadius.circular(50)),
                //     child: Center(
                //       child: Transform.scale(
                //         scale: 0.9,
                //         child: const FaIcon(
                //           FontAwesomeIcons.plus,
                //           size: 30,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        onTap: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        indicatorColor: Colors.white,
                        tabs: const [
                          Tab(
                            icon: Icon(Icons.grid_on),
                          ),
                          Tab(
                            icon: Icon(Icons.video_library),
                          ),
                          Tab(
                            icon: Icon(Icons.person_pin_sharp),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: IndexedStack(
                          index: _selectedIndex,
                          children: [
                            SizedBox(
                              height: 155 * 7,
                              child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                children: List.generate(24, (index) {
                                  return const Padding(
                                    padding: EdgeInsets.all(1.70),
                                    child: ExploreImage(
                                        url:
                                            'https://e0.pxfuel.com/wallpapers/463/330/desktop-wallpaper-peaky-blinders-6-peaky-blinders-horse-tommy.jpg'),
                                  );
                                }),
                              ),
                            ),
                            SizedBox(
                              height: 155 * 7,
                              child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                children: List.generate(24, (index) {
                                  return const Padding(
                                    padding: EdgeInsets.all(1.70),
                                    child: ExploreImage(
                                        url:
                                            'https://e0.pxfuel.com/wallpapers/620/246/desktop-wallpaper-peaky-blinders-3-peaky-blinders-cillian-murphy.jpg'),
                                  );
                                }),
                              ),
                            ),
                            SizedBox(
                              height: 155 * 7,
                              child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                children: List.generate(24, (index) {
                                  return const Padding(
                                    padding: EdgeInsets.all(1.70),
                                    child: ExploreImage(
                                        url:
                                            'https://e1.pxfuel.com/desktop-wallpaper/952/7/desktop-wallpaper-peaky-blinders-thomas-shelby-peaky-blinders.jpg'),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostGrid extends StatelessWidget {
  const PostGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        ListView.builder(
          itemBuilder: (context, index) {
            return const ExploreImage(
              url:
                  'https://e0.pxfuel.com/wallpapers/573/662/desktop-wallpaper-tommy-shelby-close-up-peaky-blinders-hair-peaky-blinder-haircut-peaky-blinders-thomas-shelby.jpg',
            );
          },
          itemCount: 20,
        )
      ],
    );
  }
}
