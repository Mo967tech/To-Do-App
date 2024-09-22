import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/models/to_do_model.dart';

part 'add_to_do_cubit_state.dart';

class AddToDoCubit extends Cubit<AddToDoCubitState> {
  AddToDoCubit() : super(AddToDoCubitInitial());

  void addToDo(ToDoModel toDo) {
    emit(AddToDoCubitLoading());
    Box<ToDoModel> toDoBox = Hive.box(kBoxName);
    toDoBox.add(toDo);
    emit(AddToDoCubitSuccess());
  }
}
