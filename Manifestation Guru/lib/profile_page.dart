import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0F172A),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 20),

              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Jane Dow",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Manifestation Explorer ✨",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 35),

              profileTile(
                icon: Icons.favorite,
                title: "Vision Board",
              ),

              profileTile(
                icon: Icons.bar_chart,
                title: "My Progress",
              ),

              profileTile(
                icon: Icons.settings,
                title: "Settings",
              ),

              profileTile(
                icon: Icons.logout,
                title: "Logout",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileTile({
    required IconData icon,
    required String title,
  }) {

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xff1E293B),
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        children: [

          Container(
            height: 50,
            width: 50,

            decoration: BoxDecoration(
              color:
              const Color(0xff4BE37B).withOpacity(0.15),

              borderRadius:
              BorderRadius.circular(16),
            ),

            child: Icon(
              icon,
              color: const Color(0xff4BE37B),
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white54,
            size: 18,
          ),
        ],
      ),
    );
  }
}