// auth_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/controller.dart';
import 'package:machine_test/view/auth/sign_up.dart';
import 'package:machine_test/view/components/my_button.dart';
import 'package:machine_test/view/components/my_textfield.dart';

class AuthScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Task Track'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                    'assets/images.png',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MYTextfield(
                  hintText: 'E-mail please',
                  controller: emailController,
                  isPassword: false,
                ),
                MYTextfield(
                  hintText: 'pasword',
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                MyButton(
                    name: 'Login',
                    onPressed: () {
                      authController.login(
                          emailController.text, passwordController.text);
                    }),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account?',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(const SignUp());
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
