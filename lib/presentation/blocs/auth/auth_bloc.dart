import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/domain/entities/auth_entity.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/auth/check_email_use_case.dart';
import 'package:e_wallet_mobile/models/sign_in_form_model.dart';
import 'package:e_wallet_mobile/models/user_update_form_model.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<AuthCheckEmail>((event, emit) async {
      emit(AuthLoading());
      final res = await CheckEmailUseCase().call(event.email);
      if (res == false) {
        emit(AuthCheckEmailSuccess());
      } else {
        emit(const AuthFailed("Email telah terdaftar."));
      }
    });
  }
}
