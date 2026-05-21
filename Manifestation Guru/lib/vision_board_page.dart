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
        "subtitle": "Grow your business",
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
                  height: 58,
                  width: 58,

                  decoration: BoxDecoration(
                    color: const Color(0xff4BE37B)
                        .withOpacity(0.15),

                    borderRadius:
                    BorderRadius.circular(18),
                  ),

                  child: Icon(
                    item["icon"],
                    color: const Color(0xff4BE37B),
                    size: 30,
                  ),
                ),

                const Spacer(),

                Text(
                  item["title"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  item["subtitle"],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
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