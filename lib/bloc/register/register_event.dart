part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class Register extends RegisterEvent{
  User user;
  String mail;
  String password;
  Register({required this.user,required this.mail,required this.password});
}
