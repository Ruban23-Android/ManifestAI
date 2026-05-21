import 'package:flutter/material.dart';

class LovePage extends StatelessWidget {
  const LovePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),

      appBar: AppBar(
        backgroundColor: const Color(0xff0B1120),

        title: const Text(
          "Love Manifest ❤️",
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
                    Color(0xffFF4B91),
                    Color(0xffFF6B6B),
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
                    "Love Energy 💕",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "\"I deserve healthy and beautiful relationships.\"",
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

            quoteTile("Self Love First"),
            quoteTile("Positive Relationships"),
            quoteTile("Spread Kindness"),
          ],
        ),
      ),
    );
  }

  Widget quoteTile(String title) {

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
            Icons.favorite,
            color: Colors.pink,
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