import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/models/to_do_model.dart';

part 'to_do_cubit_state.dart';

class ToDoCubit extends Cubit<ToDoCubitState> {
  ToDoCubit() : super(ToDoCubitInitial());

  List<ToDoModel>? toDoList;

  void fetchAllData() {
    Box<ToDoModel> toDoBox = Hive.box(kBoxName);
    toDoList = toDoBox.values.toList();
    emit(ToDoCubitSuccess());
  }
}
