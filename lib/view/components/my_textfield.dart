import 'package:flutter/material.dart';

class MYTextfield extends StatelessWidget {
  final String hintText;

  final bool isPassword;
  final TextEditingController controller;

  const MYTextfield({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0), // Add padding
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            style: TextStyle(color: Colors.black), // Set text color explicitly
            decoration: InputDecoration(
              hintText: hintText,
              // Remove default border
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
