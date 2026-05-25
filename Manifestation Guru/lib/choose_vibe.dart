import 'package:flutter/material.dart';

class ChooseVibePage extends StatelessWidget {
  const ChooseVibePage({super.key});

  final List<Map<String, dynamic>> vibes = const [
    {
      "title": "Wealth &\nFinancial Growth",
      "emoji": "🏦",
    },
    {
      "title": "Love &\nRelationships",
      "emoji": "💖",
    },
    {
      "title": "Health &\nWellness",
      "emoji": "🧘",
    },
    {
      "title": "Self-Concept &\nIdentity",
      "emoji": "✨",
    },
    {
      "title": "Mindset &\nSpiritual Growth",
      "emoji": "📈",
    },
    {
      "title": "Lifestyle\nUpgrades",
      "emoji": "🌍",
    },
    {
      "title": "Learning &\nCreativity",
      "emoji": "📚",
    },
    {
      "title": "Social Influence\n& Recognition",
      "emoji": "👑",
    },
    {
      "title": "Service &\nContribution",
      "emoji": "🤝",
    },
    {
      "title": "Custom\nManifestation",
      "emoji": "💡",
      "selected": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A4A4A),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 340,
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFB96BFF),
                  Color(0xFF6F2DBD),
                  Color(0xFFC89B3C),
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),

                /// Title
                const Text(
                  "Choose Your Vibe",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Select the transformations that resonate with your energy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 24),

                /// Grid
                Expanded(
                  child: GridView.builder(
                    itemCount: vibes.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 1.08,
                    ),
                    itemBuilder: (context, index) {
                      final item = vibes[index];
                      final bool selected = item["selected"] == true;

                      return Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: selected
                              ? const LinearGradient(
                            colors: [
                              Color(0xFFFF3AF2),
                              Color(0xFF8E2BFF),
                            ],
                          )
                              : LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.15),
                              Colors.white.withOpacity(0.05),
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.08),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                item["title"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3,
                                ),
                              ),
                            ),

                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                item["emoji"],
                                style: const TextStyle(fontSize: 34),
                              ),
                            ),

                            if (selected)
                              const Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.auto_awesome,
                                    color: Color(0xFFB400FF),
                                    size: 16,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                /// Button
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC42E),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Text(
                      "Begin My Transformation",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}