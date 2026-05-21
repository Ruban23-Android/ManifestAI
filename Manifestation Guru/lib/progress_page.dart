import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0F172A),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Your Progress 📈",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              progressCard(
                title: "Confidence",
                percent: 0.8,
              ),

              progressCard(
                title: "Health",
                percent: 0.7,
              ),

              progressCard(
                title: "Career",
                percent: 0.9,
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: const Color(0xff1E293B),
                  borderRadius: BorderRadius.circular(25),
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: const [

                    Text(
                      "Weekly Improvement",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "You completed 85% of your manifestation goals this week.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget progressCard({
    required String title,
    required double percent,
  }) {

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xff1E293B),
        borderRadius: BorderRadius.circular(25),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: [

              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "${(percent * 100).toInt()}%",
                style: const TextStyle(
                  color: Color(0xff4BE37B),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: LinearProgressIndicator(
              value: percent,
              minHeight: 10,
              backgroundColor: Colors.white24,

              valueColor:
              const AlwaysStoppedAnimation<Color>(
                Color(0xff4BE37B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}