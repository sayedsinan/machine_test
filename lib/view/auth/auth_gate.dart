// auth_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/controller.dart';
import 'package:machine_test/view/auth/sign_up.dart';

class AuthScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management App'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
                child: Container(
                  height: 50, // Adjust height as needed
                  width: double.infinity, // Expands to full width
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Set background color
                    borderRadius:
                        BorderRadius.circular(10.0), // Add border radius
                    border: Border.all(
                      // Optional border
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0), // Add padding
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'E-mail please',
                        // Remove default border
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
                child: Container(
                  height: 50, // Adjust height as needed
                  width: double.infinity, // Expands to full width
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Set background color
                    borderRadius:
                        BorderRadius.circular(10.0), // Add border radius
                    border: Border.all(
                      // Optional border
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0), // Add padding
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'password please',
                        // Remove default border
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  authController.login(
                      emailController.text, passwordController.text);
                },
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?'),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(SignUp());
                      },
                      child: Text('Sign Up'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
