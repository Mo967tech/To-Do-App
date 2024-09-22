import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do/models/to_do_model.dart';
import 'package:to_do/widgets/custom_form.dart';

class CustomEditSlidableAction extends StatefulWidget {
  final String toDoContent;
  final ToDoModel toDo;

  const CustomEditSlidableAction({
    required this.toDo,
    required this.toDoContent,
    super.key,
  });

  @override
  State<CustomEditSlidableAction> createState() =>
      _CustomEditSlidableActionState();
}

class _CustomEditSlidableActionState extends State<CustomEditSlidableAction> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final TextEditingController textEditingController;
  String? updatedToDoContent;

  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.toDoContent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    updatedToDoContent = textEditingController.text;
    return SlidableAction(
      backgroundColor: kEditSlidableActionColor,
      onPressed: (context) {
        showDialog(
          context: context,
          builder: (context) {
            return CustomForm(
              textEditingController: textEditingController,
              hintText: widget.toDoContent,
              btnName: "Edit",
              textFieldEnableBorderColor: Colors.grey,
              textFieldfocusedBorderColor: Colors.black,
              btnsColor: Colors.grey,
              onChanged: (updatedToDoContent) =>
                  this.updatedToDoContent = updatedToDoContent,
              formKey: formKey,
              backGrounColor: Colors.grey.shade600,
              btn: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  widget.toDo.content = updatedToDoContent!;
                  widget.toDo.save();
                  BlocProvider.of<ToDoCubit>(context).fetchAllData();
                  Navigator.pop(context);
                }
              },
            );
          },
        );
      },
      icon: FontAwesomeIcons.penToSquare,
      label: "Edit",
    );
  }
}
