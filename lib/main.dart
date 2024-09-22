import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/cubits/add_to_do_cubit/add_to_do_cubit.dart';
import 'package:to_do/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do/models/to_do_model.dart';
import 'package:to_do/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<ToDoModel>(ToDoModelAdapter());
  await Hive.openBox<ToDoModel>(kBoxName);
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddToDoCubit()),
        BlocProvider(create: (context) => ToDoCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
