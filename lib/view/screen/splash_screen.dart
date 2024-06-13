import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/view/auth/auth_gate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Get.off(AuthScreen());
    });

    return const Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images.png'),
            )
          ],
        )
      ],
    );
  }
}
