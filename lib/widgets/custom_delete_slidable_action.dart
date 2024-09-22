import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do/models/to_do_model.dart';

class CustomDeleteSlidableAction extends StatelessWidget {
  final ToDoModel toDo;
  const CustomDeleteSlidableAction({required this.toDo, super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {
        deleteToDo(context);
      },
      icon: FontAwesomeIcons.trash,
      label: "delete",
      backgroundColor: kDeleteBackgroundColor,
    );
  }

  void deleteToDo(BuildContext context) {
    toDo.delete();
    BlocProvider.of<ToDoCubit>(context).fetchAllData();
  }
}
