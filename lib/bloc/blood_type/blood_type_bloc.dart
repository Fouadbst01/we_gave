import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'blood_type_event.dart';
part 'blood_type_state.dart';

class BloodTypeBloc extends Bloc<BloodTypeEvent, BloodTypeState> {
  BloodTypeBloc() : super(BloodTypeInitial()) {
    on<BloodTypeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
