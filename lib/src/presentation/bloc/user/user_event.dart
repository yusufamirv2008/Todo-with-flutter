import 'package:alif_academy/src/presentation/bloc/user/user_state.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUsersEvent extends UserEvent {}
