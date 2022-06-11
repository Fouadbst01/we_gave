part of 'blood_type_bloc.dart';

@immutable
abstract class BloodTypeEvent {}

class chageTypeEvent extends BloodTypeEvent{
  String type;
  chageTypeEvent({required this.type});
}
