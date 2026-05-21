import 'package:flutter/material.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),

      appBar: AppBar(
        backgroundColor: const Color(0xff0B1120),

        title: const Text(
          "Health Manifest 🌿",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            healthCard("Meditation", Icons.self_improvement),
            healthCard("Workout", Icons.fitness_center),
            healthCard("Healthy Food", Icons.restaurant),
          ],
        ),
      ),
    );
  }

  Widget healthCard(
      String title,
      IconData icon,
      ) {

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: const Color(0xff111827),

        borderRadius:
        BorderRadius.circular(28),
      ),

      child: Row(
        children: [

          Container(
            height: 60,
            width: 60,

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

          const SizedBox(width: 20),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}