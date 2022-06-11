import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:we_gave/repositories/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository = new AuthRepository();

  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginStart());
      bool succes = await authRepository.login(event.userName, event.passwor);
      if (succes) {
        emit(LoginSucces());
      } else {
        emit(LoginError());
      }
    });
  }
}
