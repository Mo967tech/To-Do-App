import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String) onChanged;
  final Color btnColor;
  final String hintText;
  final Color focusedBorderColor;
  final Color enableBorderColor;
  final TextEditingController? textEditingController;

  const CustomTextField({
    required this.textEditingController,
    required this.enableBorderColor,
    required this.focusedBorderColor,
    required this.btnColor,
    required this.onChanged,
    this.hintText = "",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: (value) => value == "" ? "Field Is Required" : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
        ),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enableBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }
}
