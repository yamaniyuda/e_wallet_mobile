import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_top_up_payload.dart';
import 'package:e_wallet_mobile/domain/use_cases/transaction/top_up_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'top_up_event.dart';
part 'top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  TopUpBloc() : super(TopUpInitial()) {
    on<TopUpPost>(_topUp);
  }

  Future<void> _topUp(TopUpPost event, Emitter emit) async {
    try {
      emit(TopUpLoading());
      final redirectUrl = await TopUpUseCase().call(event.data);
      emit(TopUpSuccess(redirectUrl!.redirectUrl!));
    } catch (e,f) {
      rethrow;
    }
  }
}
