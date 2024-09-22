import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/cubits/add_to_do_cubit/add_to_do_cubit.dart';
import 'package:to_do/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do/widgets/notes_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToDoCubit, AddToDoCubitState>(
      builder: (context, state) {
        BlocProvider.of<ToDoCubit>(context).fetchAllData();
        return BlocBuilder<ToDoCubit, ToDoCubitState>(
          builder: (context, state) {
            return NotesList(
              toDoList: BlocProvider.of<ToDoCubit>(context).toDoList ?? [],
            );
          },
        );
      },
    );
  }
}
