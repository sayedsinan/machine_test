import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/controller.dart';
import 'package:machine_test/view/auth/auth_gate.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordControllerConforim =
        TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
            child: Container(
              height: 50, // Adjust height as needed
              width: double.infinity, // Expands to full width
              decoration: BoxDecoration(
                color: Colors.grey[200], // Set background color
                borderRadius: BorderRadius.circular(10.0), // Add border radius
                border: Border.all(
                  // Optional border
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0), // Add padding
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email please',
                    // Remove default border
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
            child: Container(
              height: 50, // Adjust height as needed
              width: double.infinity, // Expands to full width
              decoration: BoxDecoration(
                color: Colors.grey[200], // Set background color
                borderRadius: BorderRadius.circular(10.0), // Add border radius
                border: Border.all(
                  // Optional border
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0), // Add padding
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'password',
                    // Remove default border
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            child: Container(
              height: 50, // Adjust height as needed
              width: double.infinity, // Expands to full width
              decoration: BoxDecoration(
                color: Colors.grey[200], // Set background color
                borderRadius: BorderRadius.circular(10.0), // Add border radius
                border: Border.all(
                  // Optional border
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0), // Add padding
                child: TextField(
                  controller: passwordControllerConforim,
                  decoration: InputDecoration(
                    hintText: 'password conformation',
                    // Remove default border
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              authController.register(
                  emailController.text, passwordController.text);
            },
            child: Text('Register'),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?'),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Get.off(AuthScreen());
                  },
                  child: Text('Login'))
            ],
          )
        ],
      ),
    );
  }
}
