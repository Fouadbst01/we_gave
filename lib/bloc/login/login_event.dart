part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent{
  String userName;
  String passwor;

  Login({required this.userName,required this.passwor});
}

