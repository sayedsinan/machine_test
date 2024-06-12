// auth_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/controller.dart';

class AuthScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Management App')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  authController.register(
                      emailController.text, passwordController.text);
                },
                child: Text('Register'),
              ),
              ElevatedButton(
                onPressed: () {
                  authController.login(
                      emailController.text, passwordController.text);
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
