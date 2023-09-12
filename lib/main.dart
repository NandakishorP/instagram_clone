import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/create_new/create_new_view.dart';
import 'package:instagram_clone/presentation/explore/explore_view.dart';
import 'package:instagram_clone/presentation/home/home_view.dart';
import 'package:instagram_clone/presentation/login/login_view.dart';
import 'package:instagram_clone/presentation/profile/profile_view.dart';
import 'package:instagram_clone/presentation/reels/reels_view.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/presentation/widgets/bottom_navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.done:
              return const LoginView();
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _pages = [
    const HomeView(),
    const ExploreView(),
    const CreateNewView(),
    const ReelsView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
