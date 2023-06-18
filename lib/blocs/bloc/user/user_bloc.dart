import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/models/user_model.dart';
import 'package:e_wallet_mobile/service/user_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGetByUsername) {
        try {
          emit(UserLoading());
          final users = await UserService().getUsersByUsername(event.username);
          emit(UserSuccess(users));
        } catch (e) {
          rethrow;
        }
      }

      if (event is UserGetRecent) {
        try {
          emit(UserLoading());
          final users = await UserService().getRecentUsers();
          emit(UserSuccess(users));
        } catch (e) {
          rethrow;
        }
      }
    });
  }
}
