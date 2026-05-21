import 'package:flutter/material.dart';

class WealthPage extends StatelessWidget {
  const WealthPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),

      appBar: AppBar(
        backgroundColor: const Color(0xff0B1120),

        title: const Text(
          "Wealth Manifest 💰",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Container(
              padding: const EdgeInsets.all(28),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff4BE37B),
                    Color(0xff22C55E),
                  ],
                ),

                borderRadius:
                BorderRadius.circular(30),
              ),

              child: const Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    "Money Energy ✨",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "\"I attract wealth and abundance daily.\"",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Financial Goals",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            goalTile("Save ₹10 Lakhs"),
            goalTile("Buy Dream House"),
            goalTile("Start New Business"),
          ],
        ),
      ),
    );
  }

  Widget goalTile(String title) {

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xff111827),

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Row(
        children: [

          const Icon(
            Icons.check_circle,
            color: Color(0xff4BE37B),
          ),

          const SizedBox(width: 15),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}