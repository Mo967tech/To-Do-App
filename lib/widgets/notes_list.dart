import 'package:flutter/material.dart';
import 'package:to_do/models/to_do_model.dart';
import 'package:to_do/widgets/custom_to_do_item.dart';

class NotesList extends StatelessWidget {
  final List<ToDoModel> toDoList;

  const NotesList({required this.toDoList, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => CustomToDoItem(toDo: toDoList[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      itemCount: toDoList.length,
    );
  }
}
