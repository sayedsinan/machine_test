import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/controller.dart';
import 'package:machine_test/controller/theme_controller.dart';
import 'package:machine_test/view/auth/auth_gate.dart';
import 'package:machine_test/view/components/my_button.dart';
import 'package:machine_test/view/components/my_textfield.dart';
import 'package:machine_test/view/style/style.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeof = MediaQuery.of(context);
    final authController = Get.find<AuthController>();
    final ThemeController themeController = Get.find<ThemeController>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordControllerConforim =
        TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: sizeof.size.height * 0.3,
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Welcome to Task Track',
                  style: myStyle(
                    fontSize: 25,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(
                'assets/images.png',
              ),
            ),
            SizedBox(
              height: sizeof.size.height * 0.05,
            ),
            MYTextfield(
              hintText: 'E-mail please',
              controller: emailController,
            ),
            MYTextfield(
              hintText: 'password',
              controller: passwordController,
              isPassword: true,
            ),
            MYTextfield(
              hintText: 'confoirm passowrd',
              controller: passwordControllerConforim,
              isPassword: true,
            ),
            MyButton(
                name: 'Sign Up',
                onPressed: () {
                  authController.register(
                      emailController.text, passwordController.text);
                }),
            SizedBox(
              height: sizeof.size.height * 0.02,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Get.off(AuthScreen());
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
