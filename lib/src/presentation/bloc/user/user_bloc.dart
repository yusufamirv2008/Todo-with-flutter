import 'package:alif_academy/src/data/datasources/user_remote_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // final UserModel getUsers;

  UserBloc() : super(UserInitial()) {
    on<GetUsersEvent>((event, emit) async {
      emit(UserLoading());
      final result = await UserRemoteDataSourceImpl().getUsers();

      if (result.isNotEmpty) {
        emit(UserLoaded(result));
      } else {
        emit(UserError("Ошибка загрузки данных"));
      }
    });
  }
}
