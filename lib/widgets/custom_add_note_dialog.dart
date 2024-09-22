import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/cubits/add_to_do_cubit/add_to_do_cubit.dart';
import 'package:to_do/models/to_do_model.dart';
import 'package:to_do/widgets/custom_form.dart';

class CustomAddNoteDialog extends StatefulWidget {
  const CustomAddNoteDialog({super.key});

  @override
  State<CustomAddNoteDialog> createState() => _CustomAddNoteDialogState();
}

class _CustomAddNoteDialogState extends State<CustomAddNoteDialog> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? content;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToDoCubit, AddToDoCubitState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddToDoCubitLoading ? true : false,
          child: CustomForm(
            btnName: "Save",
            textFieldEnableBorderColor: Colors.grey,
            textFieldfocusedBorderColor: kPrimaryColor,
            btnsColor: kPrimaryColor,
            formKey: formKey,
            onChanged: (content) {
              this.content = content;
            },
            backGrounColor: const Color(0XFFFBEB6D),
            btn: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BlocProvider.of<AddToDoCubit>(context)
                    .addToDo(ToDoModel(content: content!));
                Navigator.pop(context);
              }
            },
          ),
        );
      },
    );
  }
}
