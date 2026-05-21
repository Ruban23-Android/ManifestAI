import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState
    extends State<SettingsPage> {

  bool notification = true;
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0B1120),

      appBar: AppBar(
        backgroundColor: const Color(0xff0B1120),
        elevation: 0,

        title: const Text(
          "Settings ⚙️",
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

            settingsTile(
              icon: Icons.notifications,
              title: "Notifications",

              trailing: Switch(
                value: notification,

                activeColor:
                const Color(0xff4BE37B),

                onChanged: (value) {

                  setState(() {
                    notification = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 18),

            settingsTile(
              icon: Icons.dark_mode,
              title: "Dark Mode",

              trailing: Switch(
                value: darkMode,

                activeColor:
                const Color(0xff4BE37B),

                onChanged: (value) {

                  setState(() {
                    darkMode = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 18),

            settingsTile(
              icon: Icons.lock,
              title: "Privacy Policy",

              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white54,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsTile({
    required IconData icon,
    required String title,
    required Widget trailing,
  }) {

    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xff111827),

        borderRadius: BorderRadius.circular(24),

        border: Border.all(
          color: Colors.white10,
        ),
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
              BorderRadius.circular(18),
            ),

            child: Icon(
              icon,
              color: const Color(0xff4BE37B),
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          trailing,
        ],
      ),
    );
  }
}