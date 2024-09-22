import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final VoidCallback onPressed;
  final Color btnColor;

  const CustomButton({
    required this.btnColor,
    required this.btnName,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: btnColor,
      onPressed: onPressed,
      child: Text(
        btnName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
