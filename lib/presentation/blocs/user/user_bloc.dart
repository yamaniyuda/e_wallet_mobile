import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/transaction/fetch_transfer_history_use_case.dart';
import 'package:e_wallet_mobile/domain/use_cases/user/fetch_data_by_username_use_case.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserGetByUsername>(_getByUsername);
    on<UserGetRecent>(_getRecent);
  }

  Future<void> _getByUsername(UserGetByUsername event, Emitter emit) async {
    try {
      emit(UserLoading());
      final users = await FetchDataByUsername().call(event.username);
      emit(UserSuccess(users));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _getRecent(UserGetRecent event, Emitter emit) async {
    try {
      emit(UserLoading());
      final users = await FetchTransferHistoryUseCase().call();
      emit(UserSuccess(users));
    } catch (e) {
      rethrow;
    }
  }
}
