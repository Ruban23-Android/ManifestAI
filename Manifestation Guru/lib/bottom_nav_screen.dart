import 'package:flutter/material.dart';
import 'home_page.dart';
import 'manifest_page.dart';
import 'progress_page.dart';
import 'profile_page.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() =>
      _BottomNavScreenState();
}

class _BottomNavScreenState
    extends State<BottomNavScreen> {

  int currentIndex = 0;

  final pages = const [

    HomePage(),
    ManifestPage(),
    ProgressPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),
      body: pages[currentIndex],

      bottomNavigationBar: Container(

        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 12,
        ),

        decoration: BoxDecoration(
          color: const Color(0xff111827),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.white10,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
            ),
          ],
        ),

        child: BottomNavigationBar(
          currentIndex: currentIndex,

          onTap: (index) {

            setState(() {
              currentIndex = index;
            });
          },

          backgroundColor: Colors.transparent,
          elevation: 0,

          selectedItemColor: const Color(0xff4BE37B),
          unselectedItemColor: Colors.white54,

          type: BottomNavigationBarType.fixed,

          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome),
              label: "Manifest",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Progress",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}