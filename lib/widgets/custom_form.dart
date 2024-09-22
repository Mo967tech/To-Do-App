import 'package:flutter/material.dart';
import 'package:to_do/widgets/custom_button.dart';
import 'package:to_do/widgets/custom_text_field.dart';

class CustomForm extends StatefulWidget {
  final Color backGrounColor;
  final VoidCallback btn;
  final GlobalKey<FormState> formKey;
  final void Function(String) onChanged;
  final Color btnsColor;
  final String hintText;
  final Color textFieldfocusedBorderColor;
  final Color textFieldEnableBorderColor;
  final TextEditingController? textEditingController;
  final String btnName;

  const CustomForm({
    this.textEditingController,
    required this.btnName,
    required this.textFieldfocusedBorderColor,
    required this.textFieldEnableBorderColor,
    required this.btnsColor,
    required this.formKey,
    required this.btn,
    required this.backGrounColor,
    required this.onChanged,
    this.hintText = "",
    super.key,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.always;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: widget.formKey,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: widget.backGrounColor,
        title: CustomTextField(
          textEditingController: widget.textEditingController,
          enableBorderColor: widget.textFieldEnableBorderColor,
          focusedBorderColor: widget.textFieldfocusedBorderColor,
          hintText: widget.hintText,
          btnColor: widget.backGrounColor,
          onChanged: widget.onChanged,
        ),
        actions: [
          CustomButton(
            btnColor: widget.btnsColor,
            onPressed: widget.btn,
            btnName: widget.btnName,
          ),
          CustomButton(
            btnColor: widget.btnsColor,
            onPressed: () => Navigator.pop(context),
            btnName: "Cancel",
          ),
        ],
      ),
    );
  }
}
