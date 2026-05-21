import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0F172A),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff111827),
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

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Top Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: const [

                      Text(
                        "Hello 👋",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "Manifest Your Future",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// Daily Motivation Card
              Container(
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff4BE37B),
                      Color(0xff22C55E),
                    ],
                  ),

                  borderRadius: BorderRadius.circular(28),
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: const [

                    Text(
                      "Today's Manifestation ✨",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "\"I attract success, positivity and abundance into my life.\"",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// Goals Section
              const Text(
                "Your Goals",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              Row(
                children: [

                  expandedCard(
                    icon: Icons.attach_money,
                    title: "Wealth",
                    progress: "80%",
                  ),

                  const SizedBox(width: 15),

                  expandedCard(
                    icon: Icons.favorite,
                    title: "Love",
                    progress: "65%",
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [

                  expandedCard(
                    icon: Icons.health_and_safety,
                    title: "Health",
                    progress: "90%",
                  ),

                  const SizedBox(width: 15),

                  expandedCard(
                    icon: Icons.work,
                    title: "Career",
                    progress: "72%",
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// Today's Tasks
              const Text(
                "Today's Tasks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              taskTile(
                title: "Morning Affirmation",
                subtitle: "Repeat positive affirmations",
              ),

              taskTile(
                title: "Visualization Session",
                subtitle: "Visualize your dream lifestyle",
              ),

              taskTile(
                title: "Gratitude Journal",
                subtitle: "Write 5 things you are grateful for",
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  static Widget expandedCard({
    required IconData icon,
    required String title,
    required String progress,
  }) {

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: const Color(0xff1E293B),
          borderRadius: BorderRadius.circular(24),
        ),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Icon(
              icon,
              color: const Color(0xff4BE37B),
              size: 34,
            ),

            const SizedBox(height: 15),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Progress $progress",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 15),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: const LinearProgressIndicator(
                value: 0.7,
                minHeight: 8,
                backgroundColor: Colors.white24,
                valueColor:
                AlwaysStoppedAnimation<Color>(
                  Color(0xff4BE37B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget taskTile({
    required String title,
    required String subtitle,
  }) {

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xff1E293B),
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        children: [

          Container(
            height: 55,
            width: 55,

            decoration: BoxDecoration(
              color: const Color(0xff4BE37B)
                  .withOpacity(0.15),

              borderRadius:
              BorderRadius.circular(18),
            ),

            child: const Icon(
              Icons.check_circle,
              color: Color(0xff4BE37B),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}