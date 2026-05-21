import 'package:flutter/material.dart';
import 'package:manifestation_guru/register_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  bool isLastPage = false;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "image": Icons.travel_explore,
      "title": "Discover Goals",
      "description":
          "Set your life goals and track your personal growth journey.",
      "color": Color(0xff6C63FF),
    },

    {
      "image": Icons.favorite,
      "title": "Manifest Dreams",
      "description":
          "Visualize your dream life with powerful daily affirmations.",
      "color": Color(0xffFF6584),
    },

    {
      "image": Icons.bar_chart,
      "title": "Achieve Success",
      "description": "Track your progress and build positive habits every day.",
      "color": Color(0xff4CAF50),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,

                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == onboardingData.length - 1;
                  });
                },

                itemBuilder: (context, index) {
                  final item = onboardingData[index];

                  return Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            color: item["color"].withOpacity(0.15),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            item["image"],
                            size: 120,
                            color: item["color"],
                          ),
                        ),

                        const SizedBox(height: 60),

                        Text(
                          item["title"],
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          item["description"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _controller.jumpToPage(onboardingData.length - 1);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),

                  SmoothPageIndicator(
                    controller: _controller,
                    count: onboardingData.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: const Color(0xff6C63FF),
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      if (isLastPage) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },

                    child: Text(
                      isLastPage ? "Done" : "Next",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6C63FF),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
