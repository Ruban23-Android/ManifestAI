import 'package:flutter/material.dart';

class CommonContentPage extends StatelessWidget {

  final String title;
  final String subtitle;
  final String content;
  final IconData icon;

  const CommonContentPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),

      appBar: AppBar(
        backgroundColor: const Color(0xff0B1120),
        elevation: 0,

        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            /// TOP CARD
            Container(
              width: double.infinity,
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

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Container(
                    height: 65,
                    width: 65,

                    decoration: BoxDecoration(
                      color:
                      Colors.white.withOpacity(0.2),

                      borderRadius:
                      BorderRadius.circular(18),
                    ),

                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// CONTENT TITLE
            const Text(
              "Today's Insight ✨",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            /// CONTENT BOX
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: const Color(0xff111827),

                borderRadius:
                BorderRadius.circular(24),

                border: Border.all(
                  color: Colors.white10,
                ),
              ),

              child: Text(
                content,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                  height: 1.8,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// AFFIRMATION CARD
            Container(
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: const Color(0xff111827),

                borderRadius:
                BorderRadius.circular(24),
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
                      BorderRadius.circular(16),
                    ),

                    child: const Icon(
                      Icons.auto_awesome,
                      color: Color(0xff4BE37B),
                    ),
                  ),

                  const SizedBox(width: 18),

                  const Expanded(
                    child: Text(
                      "\"Your thoughts create your future reality.\"",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.5,
                      ),
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