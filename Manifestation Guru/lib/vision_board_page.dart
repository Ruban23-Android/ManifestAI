import 'package:flutter/material.dart';

class VisionBoardPage extends StatelessWidget {
  const VisionBoardPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> visions = [

      {
        "title": "Dream House",
        "subtitle": "Luxury villa with peaceful life",
        "icon": Icons.home,
      },

      {
        "title": "World Tour",
        "subtitle": "Travel around the world",
        "icon": Icons.flight,
      },

      {
        "title": "Fitness Goal",
        "subtitle": "Healthy mind and body",
        "icon": Icons.fitness_center,
      },

      {
        "title": "Business Success",
        "subtitle": "Build successful startup",
        "icon": Icons.business_center,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),

      appBar: AppBar(
        backgroundColor: const Color(0xff0B1120),
        elevation: 0,

        title: const Text(
          "Vision Board ✨",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(20),

        itemCount: visions.length,

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: 0.9,
        ),

        itemBuilder: (context, index) {

          final item = visions[index];

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
                  height: 60,
                  width: 60,

                  decoration: BoxDecoration(
                    color: const Color(0xff4BE37B)
                        .withOpacity(0.15),

                    borderRadius:
                    BorderRadius.circular(18),
                  ),

                  child: Icon(
                    item["icon"],
                    color: const Color(0xff4BE37B),
                    size: 32,
                  ),
                ),

                const Spacer(),

                Text(
                  item["title"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  item["subtitle"],
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}