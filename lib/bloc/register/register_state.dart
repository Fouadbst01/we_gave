part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterStart extends RegisterState{}
class RegisterSucces extends RegisterState{}
class RegisterError extends RegisterState{}
