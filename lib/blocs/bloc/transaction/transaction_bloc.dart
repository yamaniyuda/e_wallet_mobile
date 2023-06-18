import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/models/transaction_model.dart';
import 'package:e_wallet_mobile/service/transaction_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TransactionGet) {
        try {
          emit(TransactionLoading());
          final res = await TransactionService().getTransaction();
          emit(TransactionSuccess(res));
        } catch (e) {
          emit(TransactionFailed(e.toString()));
        }
      }
    });
  }
}
