part of 'to_do_cubit.dart';

@immutable
sealed class ToDoCubitState {}

final class ToDoCubitInitial extends ToDoCubitState {}

class ToDoCubitSuccess extends ToDoCubitState {}
