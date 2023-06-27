import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/data/payloads/sign_in_payload.dart';
import 'package:e_wallet_mobile/data/payloads/sign_up_payload.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/auth/check_email_use_case.dart';
import 'package:e_wallet_mobile/domain/use_cases/auth/sign_in_use_case.dart';
import 'package:e_wallet_mobile/domain/use_cases/auth/sign_up_use_case.dart';
import 'package:e_wallet_mobile/domain/use_cases/user/get_current_user_use_case.dart';
import 'package:e_wallet_mobile/models/user_update_form_model.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<AuthCheckEmail>(_checkEmail);
    on<AuthGetCurrentUser>(_getCurrentUser);
    on<AuthRegister>(_singUp);
    on<AuthLogin>(_signIn);
  }

  Future<void> _checkEmail(AuthCheckEmail event, Emitter emit) async {
    try {
      emit(AuthLoading());
      final res = await CheckEmailUseCase().call(event.email);
      if (res == false) {
        emit(AuthCheckEmailSuccess());
      } else {
        emit(const AuthFailed("Email telah terdaftar."));
      }
    } catch (e) {
      emit(const AuthFailed("Email telah terdaftar"));
    }
  }

  Future<void> _signIn(AuthLogin event, Emitter emit) async {
    try {
      emit(AuthLoading());
      final res = await SignInUseCase().call(event.data);
      if (res == null) throw Error();
      emit(AuthSuccess(res));
    } catch (e) {
      emit(const AuthFailed("Something wrong"));
    }
  }

  Future<void> _singUp(AuthRegister event, Emitter emit) async {
    try {
      emit(AuthLoading());
      final res = await SignUpUseCase().call(event.data);
      if (res == null) throw Error();
      emit(AuthSuccess(res));
    } catch (e) {
      emit(const AuthFailed("Something wrong"));
    }
  }

  Future<void> _getCurrentUser(AuthGetCurrentUser event, Emitter emit) async {
    try {
      emit(AuthLoading());
      final res = await GetCurrentUserUseCase().call();
      if (res != null) {
        emit(AuthSuccess(res));
      } else {
        emit(const AuthFailed("Unauthorized"));
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
