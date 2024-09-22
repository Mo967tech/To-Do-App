import 'package:flutter/material.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/models/to_do_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/widgets/custom_delete_slidable_action.dart';
import 'package:to_do/widgets/custom_edit_slidable_action.dart';

class CustomToDoItem extends StatefulWidget {
  final ToDoModel toDo;

  const CustomToDoItem({required this.toDo, super.key});

  @override
  State<CustomToDoItem> createState() => _CustomToDoItemState();
}

class _CustomToDoItemState extends State<CustomToDoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          CustomEditSlidableAction(
            toDoContent: widget.toDo.content,
            toDo: widget.toDo,
          ),
          CustomDeleteSlidableAction(toDo: widget.toDo),
        ],
      ),
      child: Card(
        child: Container(
          alignment: Alignment.centerLeft,
          height: 75,
          color: kPrimaryColor,
          child: ListTile(
            leading: Checkbox(
              value: isChecked,
              onChanged: (isChecked) => setState(
                () {
                  this.isChecked = isChecked!;
                },
              ),
              activeColor: Colors.black,
            ),
            title: Text(
              widget.toDo.content,
              style: TextStyle(
                decoration: isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationThickness: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
