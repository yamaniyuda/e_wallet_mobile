import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_entity.dart';
import 'package:e_wallet_mobile/domain/entities/transfer_history_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/transaction/fetch_transaction_use_case.dart';
import 'package:e_wallet_mobile/domain/use_cases/transaction/fetch_transfer_history_use_case.dart';
import 'package:e_wallet_mobile/models/transaction_model.dart';
import 'package:e_wallet_mobile/service/transaction_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<GetTransactionHistoryEvent>(_getLatestTransaction);
  }

  Future<void> _getLatestTransaction(GetTransactionHistoryEvent event, Emitter emit) async {
    try {
      emit(TransactionLoading());
      final res = await FetchTransactionUseCase().call();
      emit(TransactionSuccess(res));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
