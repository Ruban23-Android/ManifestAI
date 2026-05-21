import 'package:flutter/material.dart';

class CareerPage extends StatelessWidget {
  const CareerPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),

      appBar: AppBar(
        backgroundColor: const Color(0xff0B1120),

        title: const Text(
          "Career Manifest 🚀",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            careerTile(
              "Leadership Skills",
              Icons.psychology,
            ),

            careerTile(
              "Team Growth",
              Icons.groups,
            ),

            careerTile(
              "Dream Job",
              Icons.work,
            ),
          ],
        ),
      ),
    );
  }

  Widget careerTile(
      String title,
      IconData icon,
      ) {

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: const Color(0xff111827),

        borderRadius:
        BorderRadius.circular(26),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: const Color(0xff4BE37B),
            size: 32,
          ),

          const SizedBox(width: 20),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}