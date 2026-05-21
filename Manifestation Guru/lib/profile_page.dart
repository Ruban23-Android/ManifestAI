import 'package:flutter/material.dart';
import 'vision_board_page.dart';
import 'my_progress_page.dart';
import 'settings_page.dart';
import 'login_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 20),

              /// PROFILE IMAGE
              Container(
                padding: const EdgeInsets.all(4),

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  border: Border.all(
                    color: const Color(0xff4BE37B),
                    width: 2,
                  ),
                ),

                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// NAME
              const Text(
                "Jane Dow",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              /// SUBTITLE
              const Text(
                "Manifestation Explorer ✨",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 35),

              /// VISION BOARD
              profileTile(
                context: context,

                icon: Icons.favorite,
                title: "Vision Board",

                onTap: () {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                      const VisionBoardPage(),
                    ),
                  );
                },
              ),

              /// MY PROGRESS
              profileTile(
                context: context,

                icon: Icons.bar_chart,
                title: "My Progress",

                onTap: () {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                      const MyProgressPage(),
                    ),
                  );
                },
              ),

              /// SETTINGS
              profileTile(
                context: context,

                icon: Icons.settings,
                title: "Settings",

                onTap: () {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                      const SettingsPage(),
                    ),
                  );
                },
              ),

              /// LOGOUT
              profileTile(
                context: context,

                icon: Icons.logout,
                title: "Logout",

                onTap: () {

                  showDialog(
                    context: context,

                    builder: (context) {

                      return AlertDialog(
                        backgroundColor:
                        const Color(0xff111827),

                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(24),
                        ),

                        title: const Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        content: const Text(
                          "Are you sure want to logout?",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),

                        actions: [

                          /// CANCEL
                          TextButton(
                            onPressed: () {

                              Navigator.pop(
                                  context);
                            },

                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                color:
                                Colors.white70,
                              ),
                            ),
                          ),

                          /// LOGOUT
                          ElevatedButton(
                            style:
                            ElevatedButton
                                .styleFrom(
                              backgroundColor:
                              const Color(
                                  0xff4BE37B),
                            ),

                            onPressed: () {

                              Navigator.pop(
                                  context);

                              Navigator.pushReplacement(
                                context,

                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                  const LoginScreen(),
                                ),
                              );
                            },

                            child: const Text(
                              "Logout",
                              style: TextStyle(
                                color:
                                Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// PROFILE TILE
  Widget profileTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {

    return GestureDetector(

      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: const Color(0xff111827),

          borderRadius: BorderRadius.circular(24),

          border: Border.all(
            color: Colors.white10,
          ),
        ),

        child: Row(
          children: [

            /// ICON
            Container(
              height: 55,
              width: 55,

              decoration: BoxDecoration(
                color: const Color(0xff4BE37B)
                    .withOpacity(0.15),

                borderRadius:
                BorderRadius.circular(18),
              ),

              child: Icon(
                icon,
                color: const Color(0xff4BE37B),
              ),
            ),

            const SizedBox(width: 18),

            /// TITLE
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// ARROW
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white54,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}