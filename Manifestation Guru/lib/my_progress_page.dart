import 'package:flutter/material.dart';

class MyProgressPage extends StatelessWidget {
  const MyProgressPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),

      appBar: AppBar(
        backgroundColor: const Color(0xff0B1120),
        elevation: 0,

        title: const Text(
          "My Progress 📈",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            progressCard(
              title: "Confidence",
              progress: 0.85,
            ),

            progressCard(
              title: "Health",
              progress: 0.72,
            ),

            progressCard(
              title: "Career",
              progress: 0.90,
            ),

            progressCard(
              title: "Wealth",
              progress: 0.65,
            ),
          ],
        ),
      ),
    );
  }

  Widget progressCard({
    required String title,
    required double progress,
  }) {

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: BorderRadius.circular(24),

        border: Border.all(
          color: Colors.white10,
        ),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: [

              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "${(progress * 100).toInt()}%",
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
              value: progress,
              minHeight: 12,

              backgroundColor: Colors.white12,

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