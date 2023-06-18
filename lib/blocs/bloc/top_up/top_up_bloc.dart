import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/models/top_up_form_model.dart';
import 'package:e_wallet_mobile/service/transaction_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'top_up_event.dart';
part 'top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  TopUpBloc() : super(TopUpInitial()) {
    on<TopUpEvent>((event, emit) async {
      if (event is TopUpPost) {
        try {
          emit(TopUpLoading());
          final redirectUrl = await TransactionService().topUp(event.data);
          emit(TopUpSuccess(redirectUrl));
        } catch (e) {
          rethrow;
        }
      }
    });
  }
}
