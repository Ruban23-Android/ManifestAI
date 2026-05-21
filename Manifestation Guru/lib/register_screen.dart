import 'package:flutter/material.dart';
import 'bottom_nav_screen.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
              fit: BoxFit.cover,
            ),
          ),

          /// Dark Overlay
          Container(color: Colors.black.withOpacity(0.45)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Back Button
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),

                  const Spacer(),

                  /// Title
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Look like you don't have an account.\nLet's create a new account for\njane.doe@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// Email
                  textField(hint: "Email", icon: Icons.email_outlined),

                  const SizedBox(height: 18),

                  /// Password
                  TextField(
                    obscureText: !isPasswordVisible,

                    decoration: InputDecoration(
                      hintText: "Password",

                      filled: true,
                      fillColor: Colors.white,

                      prefixIcon: const Icon(Icons.lock_outline),

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },

                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Terms Text
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.5,
                      ),

                      children: [
                        TextSpan(
                          text:
                              "By selecting Agree & Continue below, I agree to our ",
                        ),

                        TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(
                            color: Color(0xff4BE37B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        TextSpan(text: " and "),

                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: Color(0xff4BE37B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// Continue Button
                  SizedBox(
                    width: double.infinity,
                    height: 60,

                    child: ElevatedButton(
                        onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const BottomNavScreen(),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4BE37B),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      child: const Text(
                        "Agree and Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField({required String hint, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,

        filled: true,
        fillColor: Colors.white,

        prefixIcon: Icon(icon),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
