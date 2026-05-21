import 'package:flutter/material.dart';
import 'vision_board_page.dart';
import 'my_progress_page.dart';
import 'settings_page.dart';
import 'wealth_page.dart';
import 'health_page.dart';
import 'love_page.dart';
import 'career_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: const [

                      Text(
                        "Good Morning ✨",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "Manifest AI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.all(3),

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff4BE37B),
                        width: 2,
                      ),

                      shape: BoxShape.circle,
                    ),

                    child: const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// MAIN MANIFEST CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [
                      Color(0xff4BE37B),
                      Color(0xff22C55E),
                    ],
                  ),

                  borderRadius: BorderRadius.circular(35),

                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff4BE37B)
                          .withOpacity(0.4),

                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: const [

                        Text(
                          "Today's Energy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Icon(
                          Icons.auto_awesome,
                          color: Colors.white,
                          size: 32,
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "\"I attract abundance, happiness, and success into my life.\"",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        height: 1.6,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),

                        borderRadius:
                        BorderRadius.circular(18),
                      ),

                      child: Row(
                        children: const [

                          Icon(
                            Icons.bolt,
                            color: Colors.white,
                          ),

                          SizedBox(width: 10),

                          Text(
                            "Positive Vibes: 92%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              /// CATEGORY TITLE
              const Text(
                "Manifest Categories",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 22),

              /// GRID
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),

                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 0.92,

                children: [

                  manifestCard(
                    context: context,
                    icon: Icons.attach_money,
                    title: "Wealth",
                    subtitle: "Financial Growth",
                    page: const WealthPage(),
                  ),

                  manifestCard(
                    context: context,
                    icon: Icons.favorite,
                    title: "Love",
                    subtitle: "Healthy Relationships",
                    page: const LovePage(),
                  ),

                  manifestCard(
                    context: context,
                    icon: Icons.health_and_safety,
                    title: "Health",
                    subtitle: "Mind & Body",
                    page: const HealthPage(),
                  ),

                  manifestCard(
                    context: context,
                    icon: Icons.work,
                    title: "Career",
                    subtitle: "Professional Success",
                    page: const CareerPage(),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              /// DAILY TASK TITLE
              const Text(
                "Daily Challenges",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              challengeTile(
                context: context,
                icon: Icons.check_circle,
                title: "Morning Affirmation",
                subtitle: "Repeat 5 positive affirmations",
                page: const VisionBoardPage(),
              ),

              challengeTile(
                context: context,
                icon: Icons.psychology,
                title: "Visualization Session",
                subtitle: "Visualize your dream future",
                page: const MyProgressPage(),
              ),

              challengeTile(
                context: context,
                icon: Icons.menu_book,
                title: "Gratitude Journal",
                subtitle: "Write 3 things you are grateful for",
                page: const SettingsPage(),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  static Widget manifestCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget page,
  }) {

    return GestureDetector(

      onTap: () {

        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(22),

        decoration: BoxDecoration(
          color: const Color(0xff111827),

          borderRadius: BorderRadius.circular(28),

          border: Border.all(
            color: Colors.white10,
          ),
        ),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Container(
              height: 58,
              width: 58,

              decoration: BoxDecoration(
                color:
                const Color(0xff4BE37B)
                    .withOpacity(0.15),

                borderRadius:
                BorderRadius.circular(18),
              ),

              child: Icon(
                icon,
                color: const Color(0xff4BE37B),
                size: 32,
              ),
            ),

            const Spacer(),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              subtitle,
              maxLines: 2,

              overflow:
              TextOverflow.ellipsis,

              style: const TextStyle(
                color: Colors.white60,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget challengeTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget page,
  }) {

    return GestureDetector(

      onTap: () {

        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: const Color(0xff111827),
          borderRadius: BorderRadius.circular(24),
        ),

        child: Row(
          children: [

            Container(
              height: 58,
              width: 58,

              decoration: BoxDecoration(
                color:
                const Color(0xff4BE37B)
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

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}