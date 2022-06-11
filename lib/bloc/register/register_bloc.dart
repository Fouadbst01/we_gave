
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthRepository authRepository=new AuthRepository();
  RegisterBloc() : super(RegisterInitial()){
    on<Register>((event, emit) async {
      emit(RegisterStart());
      bool succes = await authRepository.Register(event.user, event.mail, event.password);
      if (succes) {
        emit(RegisterSucces());
      } else {
        emit(RegisterError());
      }
    });
  }
}
