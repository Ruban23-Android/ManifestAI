import 'package:flutter/material.dart';

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
                    icon: Icons.attach_money,
                    title: "Wealth",
                    subtitle: "Financial Growth",
                  ),

                  manifestCard(
                    icon: Icons.favorite,
                    title: "Love",
                    subtitle: "Healthy Relationships",
                  ),

                  manifestCard(
                    icon: Icons.health_and_safety,
                    title: "Health",
                    subtitle: "Mind & Body",
                  ),

                  manifestCard(
                    icon: Icons.work,
                    title: "Career",
                    subtitle: "Professional Success",
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
                icon: Icons.check_circle,
                title: "Morning Affirmation",
                subtitle:
                "Repeat 5 positive affirmations",
              ),

              challengeTile(
                icon: Icons.psychology,
                title: "Visualization Session",
                subtitle:
                "Visualize your dream future",
              ),

              challengeTile(
                icon: Icons.menu_book,
                title: "Gratitude Journal",
                subtitle:
                "Write 3 things you are grateful for",
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  static Widget manifestCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {

    return Container(
      padding: const EdgeInsets.all(20),

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
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              color: Colors.white60,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  static Widget challengeTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {

    return Container(
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
              const Color(0xff4BE37B).withOpacity(0.15),

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
    );
  }
}