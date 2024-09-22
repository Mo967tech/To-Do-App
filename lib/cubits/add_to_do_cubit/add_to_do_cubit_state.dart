part of 'add_to_do_cubit.dart';

@immutable
sealed class AddToDoCubitState {}

final class AddToDoCubitInitial extends AddToDoCubitState {}

class AddToDoCubitLoading extends AddToDoCubitState{}

class AddToDoCubitSuccess extends AddToDoCubitState {}

