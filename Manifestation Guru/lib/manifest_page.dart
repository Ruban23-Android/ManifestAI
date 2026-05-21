import 'package:flutter/material.dart';

class ManifestPage extends StatelessWidget {
  const ManifestPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> affirmations = [

      {
        "title": "Wealth",
        "quote":
        "Money flows easily and abundantly into my life.",
        "icon": Icons.attach_money,
      },

      {
        "title": "Confidence",
        "quote":
        "I believe in myself and my abilities.",
        "icon": Icons.auto_awesome,
      },

      {
        "title": "Love",
        "quote":
        "I attract loving and healthy relationships.",
        "icon": Icons.favorite,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff0F172A),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Manifest AI ✨",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Your daily affirmations",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: ListView.builder(
                  itemCount: affirmations.length,

                  itemBuilder: (context, index) {

                    final item = affirmations[index];

                    return Container(
                      margin:
                      const EdgeInsets.only(bottom: 20),

                      padding: const EdgeInsets.all(22),

                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff4BE37B),
                            Color(0xff22C55E),
                          ],
                        ),

                        borderRadius:
                        BorderRadius.circular(28),
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Icon(
                            item["icon"],
                            size: 42,
                            color: Colors.white,
                          ),

                          const SizedBox(height: 20),

                          Text(
                            item["title"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            item["quote"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}